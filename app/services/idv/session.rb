module Idv
  class Session
    VALID_SESSION_ATTRIBUTES = %i[
      address_edited
      address_verification_mechanism
      applicant
      document_capture_session_uuid
      flow_path
      go_back_path
      gpo_code_verified
      had_barcode_attention_error
      had_barcode_read_failure
      idv_consent_given
      idv_phone_step_document_capture_session_uuid
      mail_only_warning_shown
      personal_key
      phone_for_mobile_flow
      phone_with_camera
      pii
      pii_from_doc
      previous_phone_step_params
      profile_id
      redo_document_capture
      resolution_successful
      skip_hybrid_handoff
      ssn
      threatmetrix_review_status
      threatmetrix_session_id
      user_phone_confirmation
      vendor_phone_confirmation
      verify_info_step_document_capture_session_uuid
      welcome_visited
    ].freeze

    attr_reader :current_user, :gpo_otp, :service_provider

    def initialize(user_session:, current_user:, service_provider:)
      @user_session = user_session
      @current_user = current_user
      @service_provider = service_provider
      set_idv_session
    end

    def method_missing(method_sym, *arguments, &block)
      attr_name_sym = method_sym.to_s.delete_suffix('=').to_sym
      if VALID_SESSION_ATTRIBUTES.include?(attr_name_sym)
        return session[attr_name_sym] if arguments.empty?
        session[attr_name_sym] = arguments.first
      else
        super
      end
    end

    def respond_to_missing?(method_sym, include_private)
      attr_name_sym = method_sym.to_s.delete_suffix('=').to_sym
      VALID_SESSION_ATTRIBUTES.include?(attr_name_sym) || super
    end

    def create_profile_from_applicant_with_password(user_password)
      profile_maker = build_profile_maker(user_password)
      profile = profile_maker.save_profile(
        fraud_pending_reason: threatmetrix_fraud_pending_reason,
        gpo_verification_needed: gpo_verification_needed?,
        in_person_verification_needed: current_user.has_in_person_enrollment?,
      )

      profile.activate unless profile.reason_not_to_activate

      self.pii = profile_maker.pii_attributes
      self.profile_id = profile.id
      self.personal_key = profile.personal_key

      cache_encrypted_pii(user_password)
      associate_in_person_enrollment_with_profile

      if profile.active?
        move_pii_to_user_session
      elsif address_verification_mechanism == 'gpo'
        create_gpo_entry
      elsif current_user.has_in_person_enrollment?
        UspsInPersonProofing::EnrollmentHelper.schedule_in_person_enrollment(
          current_user,
          pii,
        )
      end
    end

    def gpo_verification_needed?
      !phone_confirmed? || address_verification_mechanism == 'gpo'
    end

    def cache_encrypted_pii(password)
      cacher = Pii::Cacher.new(current_user, session)
      cacher.save(password, profile)
    end

    def vendor_params
      applicant.merge('uuid' => current_user.uuid)
    end

    def profile
      @profile ||= Profile.find_by(id: profile_id)
    end

    def clear
      user_session.delete(:idv)
    end

    def associate_in_person_enrollment_with_profile
      return unless current_user.has_in_person_enrollment?

      current_user.establishing_in_person_enrollment.update(profile: profile)
    end

    def create_gpo_entry
      move_pii_to_user_session
      self.pii = Pii::Cacher.new(current_user, user_session).fetch if pii.is_a?(String)
      confirmation_maker = GpoConfirmationMaker.new(
        pii: pii, service_provider: service_provider,
        profile: profile
      )
      confirmation_maker.perform

      @gpo_otp = confirmation_maker.otp
    end

    def phone_otp_sent?
      user_phone_confirmation_session.present?
    end

    def user_phone_confirmation_session
      session_value = session[:user_phone_confirmation_session]
      return if session_value.blank?
      Idv::PhoneConfirmationSession.from_h(session_value)
    end

    def user_phone_confirmation_session=(new_user_phone_confirmation_session)
      session[:user_phone_confirmation_session] = new_user_phone_confirmation_session.to_h
    end

    def failed_phone_step_numbers
      session[:failed_phone_step_params] ||= []
    end

    def add_failed_phone_step_number(phone)
      parsed_phone = Phonelib.parse(phone)
      phone_e164 = parsed_phone.e164
      failed_phone_step_numbers << phone_e164 if !failed_phone_step_numbers.include?(phone_e164)
    end

    def has_pii_from_user_in_flow_session
      user_session.dig('idv/in_person', :pii_from_user)
    end

    def document_capture_complete?
      pii_from_doc || has_pii_from_user_in_flow_session || verify_info_step_complete?
    end

    def verify_info_step_complete?
      resolution_successful
    end

    def address_step_complete?
      if address_verification_mechanism == 'gpo'
        true
      else
        phone_confirmed?
      end
    end

    def address_mechanism_chosen?
      vendor_phone_confirmation == true || address_verification_mechanism == 'gpo'
    end

    def phone_confirmed?
      vendor_phone_confirmation == true && user_phone_confirmation == true
    end

    def address_confirmed?
      gpo_code_verified == true
    end

    def address_confirmed!
      session[:gpo_code_verified] = true
    end

    def invalidate_steps_after_ssn!
      # Guard against unvalidated attributes from in-person flow in review controller
      clear_applicant!

      invalidate_verify_info_step!
      invalidate_phone_step!
    end

    def clear_applicant!
      session[:applicant] = nil
    end

    def mark_verify_info_step_complete!
      session[:resolution_successful] = true
    end

    def invalidate_verify_info_step!
      session[:resolution_successful] = nil
    end

    def invalidate_steps_after_verify_info!
      session[:address_verification_mechanism] = 'phone'
      invalidate_phone_step!
    end

    def invalidate_phone_step!
      session[:vendor_phone_confirmation] = nil
      session[:user_phone_confirmation] = nil
    end

    def skip_hybrid_handoff?
      !!session[:skip_hybrid_handoff]
    end

    private

    attr_accessor :user_session

    def set_idv_session
      user_session[:idv] = new_idv_session unless user_session.key?(:idv)
    end

    def new_idv_session
      {}
    end

    def move_pii_to_user_session
      return if session[:decrypted_pii].blank?
      decrypted_pii = session.delete(:decrypted_pii)
      Pii::Cacher.new(current_user, user_session).save_decrypted_pii_json(decrypted_pii)
    end

    def session
      user_session.fetch(:idv, {})
    end

    def build_profile_maker(user_password)
      Idv::ProfileMaker.new(
        applicant: applicant,
        user: current_user,
        user_password: user_password,
        initiating_service_provider: service_provider,
      )
    end

    def threatmetrix_fraud_pending_reason
      return if !FeatureManagement.proofing_device_profiling_decisioning_enabled?

      case threatmetrix_review_status
      when 'reject'
        'threatmetrix_reject'
      when 'review'
        'threatmetrix_review'
      end
    end
  end
end
