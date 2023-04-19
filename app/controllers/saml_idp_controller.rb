require 'saml_idp_constants'
require 'saml_idp'

class SamlIdpController < ApplicationController
  include SamlIdp::Controller
  include SamlIdpAuthConcern
  include SamlIdpLogoutConcern
  include FullyAuthenticatable
  include RememberDeviceConcern
  include VerifyProfileConcern
  include AuthorizationCountConcern
  include BillableEventTrackable
  include SecureHeadersConcern
  include FraudReviewConcern

  prepend_before_action :skip_session_load, only: [:metadata, :remotelogout]
  prepend_before_action :skip_session_expiration, only: [:metadata, :remotelogout]

  skip_before_action :verify_authenticity_token
  before_action :require_path_year
  before_action :log_external_saml_auth_request, only: [:auth]
  before_action :handle_banned_user
  before_action :bump_auth_count, only: :auth
  before_action :redirect_to_sign_in, only: :auth, unless: :user_signed_in?
  before_action :confirm_two_factor_authenticated, only: :auth
  before_action :redirect_to_reauthenticate, only: :auth, if: :remember_device_expired_for_sp?

  def auth
    capture_analytics
    return redirect_to_fraud_review if fraud_review_pending? && ial2_requested?
    return redirect_to_fraud_rejection if fraud_rejection? && ial2_requested?
    return redirect_to_verification_url if profile_or_identity_needs_verification_or_decryption?
    return redirect_to(sign_up_completed_url) if needs_completion_screen_reason
    if auth_count == 1 && first_visit_for_sp?
      return redirect_to(user_authorization_confirmation_url)
    end
    link_identity_from_session_data
    handle_successful_handoff
  end

  def metadata
    # rubocop:disable Rails/RenderInline
    render inline: saml_metadata.signed, content_type: 'text/xml'
    # rubocop:enable Rails/RenderInline
  end

  def logout
    raw_saml_request = params[:SAMLRequest]
    return sign_out_with_flash if raw_saml_request.nil?

    decode_request(raw_saml_request)

    track_logout_event

    return head(:bad_request) unless valid_saml_request?

    handle_valid_sp_logout_request
  end

  def remotelogout
    raw_saml_request = params[:SAMLRequest]
    return head(:bad_request) if raw_saml_request.nil?

    decode_request(raw_saml_request)

    track_remote_logout_event

    return head(:bad_request) unless valid_saml_request?

    user_id = find_user_from_session_index

    return head(:bad_request) unless user_id.present?

    handle_valid_sp_remote_logout_request(user_id)
  end

  def external_saml_request?
    return true if request.path.start_with?('/api/saml/authpost')

    begin
      URI(request.referer).host != request.host
    rescue ArgumentError, URI::Error
      false
    end
  end

  private

  def redirect_to_sign_in
    redirect_to new_user_session_url
  end

  def redirect_to_reauthenticate
    redirect_to user_two_factor_authentication_url
  end

  def saml_metadata
    SamlEndpoint.new(params[:path_year]).saml_metadata
  end

  def redirect_to_verification_url
    return redirect_to(account_or_verify_profile_url) if profile_needs_verification?
    redirect_to(idv_url) if identity_needs_verification?
    redirect_to capture_password_url if identity_needs_decryption?
  end

  def profile_or_identity_needs_verification_or_decryption?
    return false unless ial_context.ial2_or_greater? || ialmax_requested_with_ial2_user?
    profile_needs_verification? || identity_needs_verification? || identity_needs_decryption?
  end

  def ialmax_requested_with_ial2_user?
    ial_context.ialmax_requested? && identity_needs_decryption?
  end

  def identity_needs_decryption?
    current_user.identity_verified? &&
      !Pii::Cacher.new(current_user, user_session).exists_in_session?
  end

  def capture_analytics
    analytics_payload = @result.to_h.merge(
      endpoint: api_saml_auth_path(path_year: params[:path_year]),
      idv: identity_needs_verification?,
      finish_profile: profile_needs_verification?,
      requested_ial: requested_ial,
      request_signed: saml_request.signed?,
      matching_cert_serial: saml_request.service_provider.matching_cert&.serial&.to_s,
    )
    analytics.saml_auth(**analytics_payload)
  end

  def log_external_saml_auth_request
    return unless external_saml_request?

    analytics.saml_auth_request(
      requested_ial: requested_ial,
      service_provider: saml_request&.issuer,
    )
  end

  def requested_ial
    return 'ialmax' if ial_context.ialmax_requested?

    saml_request&.requested_ial_authn_context || 'none'
  end

  def handle_successful_handoff
    track_events
    delete_branded_experience
    return redirect_to(account_url) if saml_request.response_url.blank?
    render_template_for(saml_response, saml_request.response_url, 'SAMLResponse')
  end

  def render_template_for(message, action_url, type)
    # Returns fully formed CSP array w/"'self'", domain, and ServiceProvider#redirect_uris
    redirect_uris = decorated_session.sp_redirect_uris ||
                    sp_from_request_issuer_logout&.redirect_uris.to_a.compact
    csp_uris = SecureHeadersAllowList.csp_with_sp_redirect_uris(
      action_url, redirect_uris
    )
    override_form_action_csp(csp_uris)

    render(
      template: 'saml_idp/shared/saml_post_binding',
      locals: { action_url: action_url, message: message, type: type, csp_uris: csp_uris },
      layout: false,
    )
  end

  def track_events
    analytics.sp_redirect_initiated(
      ial: ial_context.ial,
      billed_ial: ial_context.bill_for_ial_1_or_2,
    )
    track_billing_events
  end

  def require_path_year
    render_not_found if params[:path_year].blank?
  end
end
