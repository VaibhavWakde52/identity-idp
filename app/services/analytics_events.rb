# frozen_string_literal: true

#  ______________________________________
# / Adding something new in here? Please \
# \ keep methods sorted alphabetically.  /
#  --------------------------------------
#         \   ^__^
#          \  (oo)\_______
#             (__)\       )\/\
#                 ||----w |
#                 ||     ||

module AnalyticsEvents
  # @param [Boolean] success
  # When a user submits a form to delete their account
  def account_delete_submitted(success:, **extra)
    track_event('Account Delete submitted', success: success, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # When a user visits the page to delete their account
  def account_delete_visited
    track_event('Account Delete visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] request_came_from the controller/action the request came from
  # When a user deletes their account
  def account_deletion(request_came_from:, **extra)
    track_event('Account Deletion Requested', request_came_from: request_came_from, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name Account Reset
  # @param [String] user_id
  # @param [String, nil] message_id from AWS Pinpoint API
  # @param [String, nil] request_id from AWS Pinpoint API
  # An account reset was cancelled
  def account_reset_cancel(user_id:, message_id: nil, request_id: nil, **extra)
    track_event(
      'Account Reset: cancel', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        user_id: user_id,
        message_id: message_id,
        request_id: request_id,
        **extra,
      }.compact,
    )
  end

  # @identity.idp.previous_event_name Account Reset
  # @param [String] user_id
  # @param [Hash] errors
  # Validates the token used for cancelling an account reset
  def account_reset_cancel_token_validation(user_id:, errors: nil, **extra)
    track_event(
      'Account Reset: cancel token validation', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      user_id: user_id,
      errors: errors,
      **extra,
    )
  end

  # @identity.idp.previous_event_name Account Reset
  # @param [Boolean] success
  # @param [String] user_id
  # @param [Integer, nil] account_age_in_days number of days since the account was confirmed
  # @param [Time] account_confirmed_at date that account creation was confirmed
  # (rounded) or nil if the account was not confirmed
  # @param [Hash] mfa_method_counts
  # @param [Hash] errors
  # An account has been deleted through the account reset flow
  def account_reset_delete(
    success:,
    user_id:,
    account_age_in_days:,
    account_confirmed_at:,
    mfa_method_counts:,
    errors: nil,
    **extra
  )
    track_event(
      'Account Reset: delete', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      user_id: user_id,
      account_age_in_days: account_age_in_days,
      account_confirmed_at: account_confirmed_at,
      mfa_method_counts: mfa_method_counts,
      errors: errors,
      **extra,
    )
  end

  # @identity.idp.previous_event_name Account Reset
  # @param [String] user_id
  # @param [Hash] errors
  # Validates the granted token for account reset
  def account_reset_granted_token_validation(user_id: nil, errors: nil, **extra)
    track_event(
      'Account Reset: granted token validation', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      user_id: user_id,
      errors: errors,
      **extra,
    )
  end

  # @identity.idp.previous_event_name Account Reset
  # @param [Integer] count number of email notifications sent
  # Account reset was performed, logs the number of email notifications sent
  def account_reset_notifications(count:, **extra)
    track_event('Account Reset: notifications', count: count, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks users visiting the recovery options page
  def account_reset_recovery_options_visit
    track_event('Account Reset: Recovery Options Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name Account Reset
  # @param [Boolean] success
  # @param [Boolean] sms_phone does the user have a phone factor configured?
  # @param [Boolean] totp does the user have an authentication app as a 2FA option?
  # @param [Boolean] piv_cac does the user have PIV/CAC as a 2FA option?
  # @param [Integer] email_addresses number of email addresses the user has
  # @param [String, nil] message_id from AWS Pinpoint API
  # @param [String, nil] request_id from AWS Pinpoint API
  # An account reset has been requested
  def account_reset_request(
    success:,
    sms_phone:,
    totp:,
    piv_cac:,
    email_addresses:,
    request_id: nil,
    message_id: nil,
    **extra
  )
    track_event(
      'Account Reset: request', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        success: success,
        sms_phone: sms_phone,
        totp: totp,
        piv_cac: piv_cac,
        email_addresses: email_addresses,
        request_id: request_id,
        message_id: message_id,
        **extra,
      }.compact,
    )
  end

  # User visited the account deletion and reset page
  def account_reset_visit
    track_event('Account deletion and reset visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # When a user views the account page
  def account_visit
    track_event('Account Page Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [String] user_id account the email is linked to
  # A user has clicked the confirmation link in an email
  def add_email_confirmation(user_id:, success: nil, **extra)
    track_event('Add Email: Email Confirmation', user_id: user_id, success: success, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # Tracks request for adding new emails to an account
  def add_email_request(success:, errors:, **extra)
    track_event(
      'Add Email Requested', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      **extra,
    )
  end

  # When a user views the add email address page
  def add_email_visit
    track_event('Add Email Address Page Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks When users visit the add phone page
  def add_phone_setup_visit
    track_event(
      'Phone Setup Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # When a user views the "you are already signed in with the following email" screen
  def authentication_confirmation
    track_event('Authentication Confirmation') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # When a user views the "you are already signed in with the following email" screen and
  # continues with their existing logged-in email
  def authentication_confirmation_continue
    track_event('Authentication Confirmation: Continue selected') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # When a user views the "you are already signed in with the following email" screen and
  # signs out of their current logged in email to choose a different email
  def authentication_confirmation_reset
    track_event('Authentication Confirmation: Reset selected') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [DateTime] fraud_rejection_at Date when profile was rejected
  # Tracks when a profile is automatically rejected due to being under review for 30 days
  def automatic_fraud_rejection(fraud_rejection_at:, **extra)
    track_event(
      'Fraud: Automatic Fraud Rejection', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      fraud_rejection_at: fraud_rejection_at,
      **extra,
    )
  end

  # Tracks when the user creates a set of backup mfa codes.
  # @param [Integer] enabled_mfa_methods_count number of registered mfa methods for the user
  def backup_code_created(enabled_mfa_methods_count:, **extra)
    track_event(
      'Backup Code Created', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enabled_mfa_methods_count: enabled_mfa_methods_count,
      **extra,
    )
  end

  # Tracks when the user visits the Backup Code Regenerate page.
  # @param [Boolean] in_account_creation_flow whether user is going through creation flow
  def backup_code_regenerate_visit(in_account_creation_flow:, **extra)
    track_event('Backup Code Regenerate Visited', in_account_creation_flow:, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Track user creating new BackupCodeSetupForm, record form submission Hash
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Hash] error_details
  def backup_code_setup_visit(
    success:,
    errors: nil,
    error_details: nil,
    **extra
  )
    track_event(
      'Backup Code Setup Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      error_details: error_details,
      **extra,
    )
  end

  # A user that has been banned from an SP has authenticated, they are redirected
  # to a page showing them that they have been banned
  def banned_user_redirect
    track_event('Banned User redirected') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # A user that has been banned from an SP has authenticated, they have visited
  # a page showing them that they have been banned
  def banned_user_visited
    track_event('Banned User visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # A user that had a broken personal key was routed to a page to regenerate their personal key,
  # so that they no longer have a broken one
  def broken_personal_key_regenerated
    track_event('Broken Personal Key: Regenerated') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks users going back or cancelling acoount recovery
  def cancel_account_reset_recovery
    track_event('Account Reset: Cancel Account Recovery Options') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] redirect_url URL user was directed to
  # @param [String, nil] step which step
  # @param [String, nil] location which part of a step, if applicable
  # @param ["idv", String, nil] flow which flow
  # User was redirected to the login.gov contact page
  def contact_redirect(redirect_url:, step: nil, location: nil, flow: nil, **extra)
    track_event(
      'Contact Page Redirect', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      redirect_url: redirect_url,
      step: step,
      location: location,
      flow: flow,
      **extra,
    )
  end

  # @param [String] message the warning
  # @param [String] getting_started_ab_test_bucket Which initial IdV screen the user saw
  # @param [String] phone_question_ab_test_bucket Prompt user with phone question before doc auth
  # Logged when there is a non-user-facing error in the doc auth process, such as an unrecognized
  # field from a vendor
  def doc_auth_warning(message: nil, getting_started_ab_test_bucket: nil,
                       phone_question_ab_test_bucket: nil, **extra)
    track_event(
      'Doc Auth Warning', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      message: message,
      getting_started_ab_test_bucket: getting_started_ab_test_bucket,
      phone_question_ab_test_bucket: phone_question_ab_test_bucket,
      **extra,
    )
  end

  # When a user views the edit password page
  def edit_password_visit
    track_event('Edit Password Page Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [String] user_id
  # @param [Boolean] user_locked_out if the user is currently locked out of their second factor
  # @param [String] bad_password_count represents number of prior login failures
  # @param [String] stored_location the URL to return to after signing in
  # @param [Boolean] sp_request_url_present if was an SP request URL in the session
  # @param [Boolean] remember_device if the remember device cookie was present
  # Tracks authentication attempts at the email/password screen
  def email_and_password_auth(
    success:,
    user_id:,
    user_locked_out:,
    bad_password_count:,
    stored_location:,
    sp_request_url_present:,
    remember_device:,
    **extra
  )
    track_event(
      'Email and Password Authentication', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      user_id: user_id,
      user_locked_out: user_locked_out,
      bad_password_count: bad_password_count,
      stored_location: stored_location,
      sp_request_url_present: sp_request_url_present,
      remember_device: remember_device,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # Tracks request for deletion of email address
  def email_deletion_request(success:, errors:, **extra)
    track_event(
      'Email Deletion Requested', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # Tracks if Email Language is updated
  def email_language_updated(success:, errors:, **extra)
    track_event(
      'Email Language: Updated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      **extra,
    )
  end

  # Tracks if Email Language is visited
  def email_language_visited
    track_event('Email Language: Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Logs after an email is sent
  # @param [String] action type of email being sent
  # @param [String, nil] ses_message_id AWS SES Message ID
  def email_sent(action:, ses_message_id:, **extra)
    track_event(
      'Email Sent', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      action: action,
      ses_message_id: ses_message_id,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Time, nil] event_created_at timestamp for the event
  # @param [Time, nil] disavowed_device_last_used_at
  # @param [String, nil] disavowed_device_user_agent
  # @param [String, nil] disavowed_device_last_ip
  # @param [Integer, nil] event_id events table id
  # @param [String, nil] event_type (see Event#event_type)
  # @param [String, nil] event_ip ip address for the event
  # Tracks disavowed event
  def event_disavowal(
    success:,
    errors:,
    event_created_at: nil,
    disavowed_device_last_used_at: nil,
    disavowed_device_user_agent: nil,
    disavowed_device_last_ip: nil,
    event_id: nil,
    event_type: nil,
    event_ip: nil,
    **extra
  )
    track_event(
      'Event disavowal visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      event_created_at: event_created_at,
      disavowed_device_last_used_at: disavowed_device_last_used_at,
      disavowed_device_user_agent: disavowed_device_user_agent,
      disavowed_device_last_ip: disavowed_device_last_ip,
      event_id: event_id,
      event_type: event_type,
      event_ip: event_ip,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Time, nil] event_created_at timestamp for the event
  # @param [Time, nil] disavowed_device_last_used_at
  # @param [String, nil] disavowed_device_user_agent
  # @param [String, nil] disavowed_device_last_ip
  # @param [Integer, nil] event_id events table id
  # @param [String, nil] event_type (see Event#event_type)
  # @param [String, nil] event_ip ip address for the event
  # Event disavowal password reset was performed
  def event_disavowal_password_reset(
    success:,
    errors:,
    event_created_at: nil,
    disavowed_device_last_used_at: nil,
    disavowed_device_user_agent: nil,
    disavowed_device_last_ip: nil,
    event_id: nil,
    event_type: nil,
    event_ip: nil,
    **extra
  )
    track_event(
      'Event disavowal password reset', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      event_created_at: event_created_at,
      disavowed_device_last_used_at: disavowed_device_last_used_at,
      disavowed_device_user_agent: disavowed_device_user_agent,
      disavowed_device_last_ip: disavowed_device_last_ip,
      event_id: event_id,
      event_type: event_type,
      event_ip: event_ip,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Time, nil] event_created_at timestamp for the event
  # @param [Time, nil] disavowed_device_last_used_at
  # @param [String, nil] disavowed_device_user_agent
  # @param [String, nil] disavowed_device_last_ip
  # @param [Integer, nil] event_id events table id
  # @param [String, nil] event_type (see Event#event_type)
  # @param [String, nil] event_ip ip address for the event
  # An invalid disavowal token was clicked
  def event_disavowal_token_invalid(
    success:,
    errors:,
    event_created_at: nil,
    disavowed_device_last_used_at: nil,
    disavowed_device_user_agent: nil,
    disavowed_device_last_ip: nil,
    event_id: nil,
    event_type: nil,
    event_ip: nil,
    **extra
  )
    track_event(
      'Event disavowal token invalid', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      event_created_at: event_created_at,
      disavowed_device_last_used_at: disavowed_device_last_used_at,
      disavowed_device_user_agent: disavowed_device_user_agent,
      disavowed_device_last_ip: disavowed_device_last_ip,
      event_id: event_id,
      event_type: event_type,
      event_ip: event_ip,
      **extra,
    )
  end

  # User visited the events page
  def events_visit
    track_event('Events Page Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] redirect_url URL user was directed to
  # @param [String, nil] step which step
  # @param [String, nil] location which part of a step, if applicable
  # @param ["idv", String, nil] flow which flow
  # User was redirected to a page outside the IDP
  def external_redirect(redirect_url:, step: nil, location: nil, flow: nil, **extra)
    track_event(
      'External Redirect', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      redirect_url: redirect_url,
      step: step,
      location: location,
      flow: flow,
      **extra,
    )
  end

  # The user chose to "forget all browsers"
  def forget_all_browsers_submitted
    track_event('Forget All Browsers Submitted') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # The user visited the "forget all browsers" page
  def forget_all_browsers_visited
    track_event('Forget All Browsers Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] exception
  # @param [String] profile_fraud_review_pending_at
  # The user was passed by manual fraud review
  def fraud_review_passed(
    success:,
    errors:,
    exception:,
    profile_fraud_review_pending_at:,
    **extra
  )
    track_event(
      'Fraud: Profile review passed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      exception: exception,
      profile_fraud_review_pending_at: profile_fraud_review_pending_at,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] exception
  # @param [String] profile_fraud_review_pending_at
  # The user was rejected by manual fraud review
  def fraud_review_rejected(
    success:,
    errors:,
    exception:,
    profile_fraud_review_pending_at:,
    **extra
  )
    track_event(
      'Fraud: Profile review rejected', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      exception: exception,
      profile_fraud_review_pending_at: profile_fraud_review_pending_at,
      **extra,
    )
  end

  # An uncaught error occurred in frontend JavaScript
  # @param [String] name
  # @param [String] message
  # @param [String] stack
  def frontend_error(name:, message:, stack: nil, **_extra)
    track_event('Frontend Error', name:, message:, stack:) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # The Acuant SDK was loaded
  def idv_acuant_sdk_loaded(success:, **_extra)
    track_event(
      'Frontend: IdV: Acuant SDK loaded', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
    )
  end

  # @param [Boolean] success
  # @param [Boolean] address_edited
  # @param [Hash] pii_like_keypaths
  # @param [Hash] errors
  # @param [Hash] error_details
  # User submitted an idv address
  def idv_address_submitted(
    success:,
    errors:,
    address_edited: nil,
    pii_like_keypaths: nil,
    error_details: nil,
    **extra
  )
    track_event(
      'IdV: address submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      address_edited: address_edited,
      pii_like_keypaths: pii_like_keypaths,
      error_details: error_details,
      **extra,
    )
  end

  # User visited idv address page
  def idv_address_visit
    track_event('IdV: address visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] acuantCaptureMode
  # @param [Boolean] acuant_sdk_upgrade_a_b_testing_enabled
  # @param [String] acuant_version
  # @param [Boolean] assessment
  # @param [Integer] attempt number of attempts
  # @param [String] documentType
  # @param [Integer] dpi  dots per inch of image
  # @param [Integer] failedImageResubmission
  # @param [String] fingerprint fingerprint of the image added
  # @param [String] flow_path whether the user is in the hybrid or standard flow
  # @param [Integer] glare
  # @param [Integer] glareScoreThreshold
  # @param [Integer] height height of image added in pixels
  # @param [Boolean] isAssessedAsBlurry
  # @param [Boolean] isAssessedAsGlare
  # @param [Boolean] isAssessedAsUnsupported
  # @param [String] mimeType MIME type of image added
  # @param [Integer] moire
  # @param [String] phone_question_ab_test_bucket
  # @param [Integer] sharpness
  # @param [Integer] sharpnessScoreThreshold
  # @param [Integer] size size of image added in bytes
  # @param [String] source
  # @param [Boolean] use_alternate_sdk
  # @param [Integer] width width of image added in pixels
  # Back image was added in document capture
  # rubocop:disable Naming/VariableName,Naming/MethodParameterName
  def idv_back_image_added(
    acuantCaptureMode:,
    acuant_sdk_upgrade_a_b_testing_enabled:,
    acuant_version:,
    assessment:,
    attempt:,
    documentType:,
    dpi:,
    failedImageResubmission:,
    fingerprint:,
    flow_path:,
    glare:,
    glareScoreThreshold:,
    height:,
    isAssessedAsBlurry:,
    isAssessedAsGlare:,
    isAssessedAsUnsupported:,
    mimeType:,
    moire:,
    phone_question_ab_test_bucket:,
    sharpness:,
    sharpnessScoreThreshold:,
    size:,
    source:,
    use_alternate_sdk:,
    width:,
    **_extra
  )
    track_event(
      'Frontend: IdV: back image added', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      acuantCaptureMode: acuantCaptureMode,
      acuant_sdk_upgrade_a_b_testing_enabled: acuant_sdk_upgrade_a_b_testing_enabled,
      acuant_version: acuant_version,
      assessment: assessment,
      attempt: attempt,
      documentType: documentType,
      dpi: dpi,
      failedImageResubmission: failedImageResubmission,
      fingerprint: fingerprint,
      flow_path: flow_path,
      glare: glare,
      glareScoreThreshold: glareScoreThreshold,
      height: height,
      isAssessedAsBlurry: isAssessedAsBlurry,
      isAssessedAsGlare: isAssessedAsGlare,
      isAssessedAsUnsupported: isAssessedAsUnsupported,
      mimeType: mimeType,
      moire: moire,
      phone_question_ab_test_bucket: phone_question_ab_test_bucket,
      sharpness: sharpness,
      sharpnessScoreThreshold: sharpnessScoreThreshold,
      size: size,
      source: source,
      use_alternate_sdk: use_alternate_sdk,
      width: width,
    )
  end
  # rubocop:enable Naming/VariableName,Naming/MethodParameterName

  def idv_back_image_clicked(**_extra)
    track_event(
      'Frontend: IdV: back image clicked', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  def idv_barcode_warning_continue_clicked(**_extra)
    track_event(
      'Frontend: IdV: barcode warning continue clicked', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  def idv_barcode_warning_retake_photos_clicked(**_extra)
    track_event(
      'Frontend: IdV: barcode warning retake photos clicked', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # @param [String] step the step that the user was on when they clicked cancel
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user confirmed their choice to cancel going through IDV
  def idv_cancellation_confirmed(step:, proofing_components: nil, **extra)
    track_event(
      'IdV: cancellation confirmed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      step: step,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [String] step the step that the user was on when they clicked cancel
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user chose to go back instead of cancel IDV
  def idv_cancellation_go_back(step:, proofing_components: nil, **extra)
    track_event(
      'IdV: cancellation go back', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      step: step,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [String] step the step that the user was on when they clicked cancel
  # @param [String] request_came_from the controller and action from the
  #   source such as "users/sessions#new"
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user clicked cancel during IDV (presented with an option to go back or confirm)
  def idv_cancellation_visited(
    step:,
    request_came_from:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: cancellation visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      step: step,
      request_came_from: request_came_from,
      proofing_components: proofing_components,
      **extra,
    )
  end

  def idv_capture_troubleshooting_dismissed(**_extra)
    track_event(
      'Frontend: IdV: Capture troubleshooting dismissed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  def idv_clicked_sp_link_on_ready_to_verify_page(**_extra)
    track_event(
      'Frontend: IdV: user clicked sp link on ready to verify page', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  def idv_clicked_what_to_bring_link_on_ready_to_verify_page(**_extra)
    track_event(
      'Frontend: IdV: user clicked what to bring link on ready to verify page', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # The user checked or unchecked the "By checking this box..." checkbox on the idv agreement step.
  # (This is a frontend event.)
  # @param [Boolean] checked Whether the user checked the checkbox
  def idv_consent_checkbox_toggled(checked:, **extra)
    track_event(
      'IdV: consent checkbox toggled', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      checked: checked,
      **extra,
    )
  end

  # User has consented to share information with document upload and may
  # view the "hybrid handoff" step next unless "skip_hybrid_handoff" param is true
  def idv_doc_auth_agreement_submitted(**extra)
    track_event('IdV: doc auth agreement submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_agreement_visited(**extra)
    track_event('IdV: doc auth agreement visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_capture_complete_visited(**extra)
    track_event('IdV: doc auth capture_complete visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_document_capture_submitted(**extra)
    track_event('IdV: doc auth document_capture submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_document_capture_visited(**extra)
    track_event('IdV: doc auth document_capture visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] step_name which step the user was on
  # @param [Integer] remaining_attempts how many attempts the user has left before
  #                  we rate limit them
  # The user visited an error page due to an encountering an exception talking to a proofing vendor
  def idv_doc_auth_exception_visited(step_name:, remaining_attempts:, **extra)
    track_event(
      'IdV: doc auth exception visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      step_name: step_name,
      remaining_attempts: remaining_attempts,
      **extra,
    )
  end

  # @param [String] side the side of the image submission
  def idv_doc_auth_failed_image_resubmitted(side:, **extra)
    track_event(
      'IdV: failed doc image resubmitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      side: side,
      **extra,
    )
  end

  def idv_doc_auth_getting_started_submitted(**extra)
    track_event('IdV: doc auth getting_started submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_getting_started_visited(**extra)
    track_event('IdV: doc auth getting_started visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # The "hybrid handoff" step: Desktop user has submitted their choice to
  # either continue via desktop ("document_capture" destination) or switch
  # to mobile phone ("send_link" destination) to perform document upload.
  # @identity.idp.previous_event_name IdV: doc auth upload submitted
  def idv_doc_auth_hybrid_handoff_submitted(**extra)
    track_event('IdV: doc auth hybrid handoff submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Desktop user has reached the above "hybrid handoff" view
  # @identity.idp.previous_event_name IdV: doc auth upload visited
  def idv_doc_auth_hybrid_handoff_visited(**extra)
    track_event('IdV: doc auth hybrid handoff visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name IdV: doc auth send_link submitted
  def idv_doc_auth_link_sent_submitted(**extra)
    track_event('IdV: doc auth link_sent submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_link_sent_visited(**extra)
    track_event('IdV: doc auth link_sent visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # The "phone question" step: Desktop user has submitted they
  # do or do not have a phone with a a camera via desktop
  def idv_doc_auth_phone_question_submitted(**extra)
    track_event(:idv_doc_auth_phone_question_submitted, **extra)
  end

  # Desktop user has reached the above "phone question" view
  def idv_doc_auth_phone_question_visited(**extra)
    track_event(:idv_doc_auth_phone_question_visited, **extra)
  end

  def idv_doc_auth_randomizer_defaulted
    track_event(
      'IdV: doc_auth random vendor error', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      error: 'document_capture_session_uuid_key missing',
    )
  end

  # @identity.idp.previous_event_name IdV: in person proofing redo_address submitted
  def idv_doc_auth_redo_address_submitted(**extra)
    track_event('IdV: doc auth redo_address submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_redo_ssn_submitted(**extra)
    track_event('IdV: doc auth redo_ssn submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name IdV: in person proofing ssn submitted
  def idv_doc_auth_ssn_submitted(**extra)
    track_event('IdV: doc auth ssn submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name IdV: in person proofing ssn visited
  def idv_doc_auth_ssn_visited(**extra)
    track_event('IdV: doc auth ssn visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Integer] attempts
  # @param [Integer] remaining_attempts
  # @param [String] user_id
  # @param [String] flow_path
  # @param [String] front_image_fingerprint Fingerprint of front image data
  # @param [String] back_image_fingerprint Fingerprint of back image data
  # @param [String] getting_started_ab_test_bucket Which initial IdV screen the user saw
  # @param [String] phone_question_ab_test_bucket Prompt user with phone question before doc auth
  # The document capture image uploaded was locally validated during the IDV process
  def idv_doc_auth_submitted_image_upload_form(
    success:,
    errors:,
    remaining_attempts:,
    flow_path:,
    attempts: nil,
    user_id: nil,
    front_image_fingerprint: nil,
    back_image_fingerprint: nil,
    getting_started_ab_test_bucket: nil,
    phone_question_ab_test_bucket: nil,
    **extra
  )
    track_event(
      'IdV: doc auth image upload form submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      attempts: attempts,
      remaining_attempts: remaining_attempts,
      user_id: user_id,
      flow_path: flow_path,
      front_image_fingerprint: front_image_fingerprint,
      back_image_fingerprint: back_image_fingerprint,
      getting_started_ab_test_bucket: getting_started_ab_test_bucket,
      phone_question_ab_test_bucket: phone_question_ab_test_bucket,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] exception
  # @param [Boolean] billed
  # @param [String] doc_auth_result
  # @param [String] state
  # @param [String] state_id_type
  # @param [Boolean] async
  # @param [Integer] attempts
  # @param [Integer] remaining_attempts
  # @param [Hash] client_image_metrics
  # @param [String] flow_path
  # @param [Float] vendor_request_time_in_ms Time it took to upload images & get a response.
  # @param [String] front_image_fingerprint Fingerprint of front image data
  # @param [String] back_image_fingerprint Fingerprint of back image data
  # @param [String] getting_started_ab_test_bucket Which initial IdV screen the user saw
  # @param [String] phone_question_ab_test_bucket Prompt user with phone question before doc auth
  # The document capture image was uploaded to vendor during the IDV process
  def idv_doc_auth_submitted_image_upload_vendor(
    success:,
    errors:,
    exception:,
    state:,
    state_id_type:,
    async:, attempts:,
    remaining_attempts:,
    client_image_metrics:,
    flow_path:,
    billed: nil,
    doc_auth_result: nil,
    vendor_request_time_in_ms: nil,
    front_image_fingerprint: nil,
    back_image_fingerprint: nil,
    getting_started_ab_test_bucket: nil,
    phone_question_ab_test_bucket: nil,
    **extra
  )
    track_event(
      'IdV: doc auth image upload vendor submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      exception: exception,
      billed: billed,
      doc_auth_result: doc_auth_result,
      state: state,
      state_id_type: state_id_type,
      async: async,
      attempts: attempts,
      remaining_attempts: remaining_attempts,
      client_image_metrics: client_image_metrics,
      flow_path: flow_path,
      vendor_request_time_in_ms: vendor_request_time_in_ms,
      front_image_fingerprint: front_image_fingerprint,
      back_image_fingerprint: back_image_fingerprint,
      getting_started_ab_test_bucket: getting_started_ab_test_bucket,
      phone_question_ab_test_bucket: phone_question_ab_test_bucket,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] user_id
  # @param [Integer] remaining_attempts
  # @param [Hash] pii_like_keypaths
  # @param [String] flow_path
  # @param [String] front_image_fingerprint Fingerprint of front image data
  # @param [String] back_image_fingerprint Fingerprint of back image data
  # @param [String] getting_started_ab_test_bucket Which initial IdV screen the user saw
  # @param [Hash] classification_info document image side information, issuing country and type etc
  # The PII that came back from the document capture vendor was validated
  def idv_doc_auth_submitted_pii_validation(
    success:,
    errors:,
    remaining_attempts:,
    pii_like_keypaths:,
    flow_path:,
    user_id: nil,
    front_image_fingerprint: nil,
    back_image_fingerprint: nil,
    getting_started_ab_test_bucket: nil,
    classification_info: {},
    **extra
  )
    track_event(
      'IdV: doc auth image upload vendor pii validation', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      user_id: user_id,
      remaining_attempts: remaining_attempts,
      pii_like_keypaths: pii_like_keypaths,
      flow_path: flow_path,
      front_image_fingerprint: front_image_fingerprint,
      back_image_fingerprint: back_image_fingerprint,
      getting_started_ab_test_bucket: getting_started_ab_test_bucket,
      classification_info: classification_info,
      **extra,
    )
  end

  def idv_doc_auth_verify_proofing_results(**extra)
    track_event('IdV: doc auth verify proofing results', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name IdV: in person proofing verify submitted
  def idv_doc_auth_verify_submitted(**extra)
    track_event('IdV: doc auth verify submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name IdV: in person proofing verify visited
  def idv_doc_auth_verify_visited(**extra)
    track_event('IdV: doc auth verify visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] step_name
  # @param [Integer] remaining_attempts
  # The user was sent to a warning page during the IDV flow
  def idv_doc_auth_warning_visited(
    step_name:,
    remaining_attempts:,
    **extra
  )
    track_event(
      'IdV: doc auth warning visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      step_name: step_name,
      remaining_attempts: remaining_attempts,
      **extra,
    )
  end

  def idv_doc_auth_welcome_submitted(**extra)
    track_event('IdV: doc auth welcome submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_doc_auth_welcome_visited(**extra)
    track_event('IdV: doc auth welcome visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # User submitted IDV password confirm page
  # @param [Boolean] success
  # @param [Boolean] fraud_review_pending
  # @param [Boolean] fraud_rejection
  # @param [Boolean] gpo_verification_pending
  # @param [Boolean] in_person_verification_pending
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # @param [String, nil] deactivation_reason Reason user's profile was deactivated, if any.
  def idv_enter_password_complete(
    success:,
    fraud_review_pending:,
    fraud_rejection:,
    gpo_verification_pending:,
    in_person_verification_pending:,
    deactivation_reason: nil,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: review complete', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      deactivation_reason: deactivation_reason,
      fraud_review_pending: fraud_review_pending,
      gpo_verification_pending: gpo_verification_pending,
      in_person_verification_pending: in_person_verification_pending,
      fraud_rejection: fraud_rejection,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's
  #        current proofing components
  # @param [String] address_verification_method The method (phone or gpo) being
  #        used to verify the user's identity
  # User visited IDV password confirm page
  def idv_enter_password_visited(
    proofing_components: nil,
    address_verification_method: nil,
    **extra
  )
    track_event(
      'IdV: review info visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      address_verification_method: address_verification_method,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Array] ids ID Types the user has checked whether they have
  # Exit survey of optional questions when the user leaves document capture
  def idv_exit_optional_questions(ids:, **_extra)
    track_event(
      'Frontend: IdV: exit optional questions', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      ids: ids,
    )
  end

  # @param [Boolean] success
  # @param [String, nil] deactivation_reason Reason user's profile was deactivated, if any.
  # @param [Boolean] fraud_review_pending Profile is under review for fraud
  # @param [Boolean] fraud_rejection Profile is rejected due to fraud
  # @param [Boolean] gpo_verification_pending Profile is awaiting gpo verificaiton
  # @param [Boolean] in_person_verification_pending Profile is awaiting in person verificaiton
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # @see Reporting::IdentityVerificationReport#query This event is used by the identity verification
  #       report. Changes here should be reflected there.
  # Tracks the last step of IDV, indicates the user successfully proofed
  def idv_final(
    success:,
    fraud_review_pending:,
    fraud_rejection:,
    gpo_verification_pending:,
    in_person_verification_pending:,
    deactivation_reason: nil,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: final resolution', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      fraud_review_pending: fraud_review_pending,
      fraud_rejection: fraud_rejection,
      gpo_verification_pending: gpo_verification_pending,
      in_person_verification_pending: in_person_verification_pending,
      deactivation_reason: deactivation_reason,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # User visited forgot password page
  def idv_forgot_password(proofing_components: nil, **extra)
    track_event(
      'IdV: forgot password visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # User confirmed forgot password
  def idv_forgot_password_confirmed(proofing_components: nil, **extra)
    track_event(
      'IdV: forgot password confirmed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [String] acuantCaptureMode
  # @param [Boolean] acuant_sdk_upgrade_a_b_testing_enabled
  # @param [String] acuant_version
  # @param [Boolean] assessment
  # @param [Integer] attempt number of attempts
  # @param [String] documentType
  # @param [Integer] dpi  dots per inch of image
  # @param [Integer] failedImageResubmission
  # @param [String] fingerprint fingerprint of the image added
  # @param [String] flow_path whether the user is in the hybrid or standard flow
  # @param [Integer] glare
  # @param [Integer] glareScoreThreshold
  # @param [Integer] height height of image added in pixels
  # @param [Boolean] isAssessedAsBlurry
  # @param [Boolean] isAssessedAsGlare
  # @param [Boolean] isAssessedAsUnsupported
  # @param [String] mimeType MIME type of image added
  # @param [Integer] moire
  # @param [String] phone_question_ab_test_bucket
  # @param [Integer] sharpness
  # @param [Integer] sharpnessScoreThreshold
  # @param [Integer] size size of image added in bytes
  # @param [String] source
  # @param [Boolean] use_alternate_sdk
  # @param [Integer] width width of image added in pixels
  # Front image was added in document capture
  # rubocop:disable Naming/VariableName,Naming/MethodParameterName
  def idv_front_image_added(
    acuantCaptureMode:,
    acuant_sdk_upgrade_a_b_testing_enabled:,
    acuant_version:,
    assessment:,
    attempt:,
    documentType:,
    dpi:,
    failedImageResubmission:,
    fingerprint:,
    flow_path:,
    glare:,
    glareScoreThreshold:,
    height:,
    isAssessedAsBlurry:,
    isAssessedAsGlare:,
    isAssessedAsUnsupported:,
    mimeType:,
    moire:,
    phone_question_ab_test_bucket:,
    sharpness:,
    sharpnessScoreThreshold:,
    size:,
    source:,
    use_alternate_sdk:,
    width:,
    **_extra
  )
    track_event(
      'Frontend: IdV: front image added', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      acuantCaptureMode: acuantCaptureMode,
      acuant_sdk_upgrade_a_b_testing_enabled: acuant_sdk_upgrade_a_b_testing_enabled,
      acuant_version: acuant_version,
      assessment: assessment,
      attempt: attempt,
      documentType: documentType,
      dpi: dpi,
      failedImageResubmission: failedImageResubmission,
      fingerprint: fingerprint,
      flow_path: flow_path,
      glare: glare,
      glareScoreThreshold: glareScoreThreshold,
      height: height,
      isAssessedAsBlurry: isAssessedAsBlurry,
      isAssessedAsGlare: isAssessedAsGlare,
      isAssessedAsUnsupported: isAssessedAsUnsupported,
      mimeType: mimeType,
      moire: moire,
      phone_question_ab_test_bucket: phone_question_ab_test_bucket,
      sharpness: sharpness,
      sharpnessScoreThreshold: sharpnessScoreThreshold,
      size: size,
      source: source,
      use_alternate_sdk: use_alternate_sdk,
      width: width,
    )
  end
  # rubocop:enable Naming/VariableName,Naming/MethodParameterName

  def idv_front_image_clicked(**_extra)
    track_event(
      'Frontend: IdV: front image clicked', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # @param [DateTime] enqueued_at When letter was enqueued
  # @param [Boolean] resend User requested a second (or more) letter
  # @param [DateTime] first_letter_requested_at When the profile became gpo_pending
  # @param [Integer] hours_since_first_letter Difference between first_letter_requested_at
  #                  and now in hours
  # @param [Integer] phone_step_attempts Number of attempts at phone step before requesting letter
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # GPO letter was enqueued and the time at which it was enqueued
  def idv_gpo_address_letter_enqueued(
    enqueued_at:,
    resend:,
    first_letter_requested_at:,
    hours_since_first_letter:,
    phone_step_attempts:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: USPS address letter enqueued', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enqueued_at: enqueued_at,
      resend: resend,
      first_letter_requested_at: first_letter_requested_at,
      hours_since_first_letter: hours_since_first_letter,
      phone_step_attempts: phone_step_attempts,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Boolean] resend
  # @param [DateTime] first_letter_requested_at When the profile became gpo_pending
  # @param [Integer] hours_since_first_letter Difference between first_letter_requested_at
  #                  and now in hours
  # @param [Integer] phone_step_attempts Number of attempts at phone step before requesting letter
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # GPO letter was requested
  def idv_gpo_address_letter_requested(
    resend:,
    first_letter_requested_at:,
    hours_since_first_letter:,
    phone_step_attempts:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: USPS address letter requested', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      resend: resend,
      first_letter_requested_at:,
      hours_since_first_letter:,
      phone_step_attempts:,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # The user visited the gpo confirm cancellation screen from RequestLetter
  def idv_gpo_confirm_start_over_before_letter_visited(**extra)
    track_event(:idv_gpo_confirm_start_over_before_letter_visited, **extra)
  end

  # The user visited the gpo confirm cancellation screen
  def idv_gpo_confirm_start_over_visited(**extra)
    track_event('IdV: gpo confirm start over visited', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # A GPO reminder email was sent to the user
  # @param [String] user_id UUID of user who we sent a reminder to
  def idv_gpo_reminder_email_sent(user_id:, **extra)
    track_event('IdV: gpo reminder email sent', user_id: user_id, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  def idv_image_capture_failed(**_extra)
    track_event(
      'Frontend: IdV: Image capture failed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # Tracks emails that are initiated during InPerson::EmailReminderJob
  # @param [String] email_type early or late
  # @param [String] enrollment_id
  def idv_in_person_email_reminder_job_email_initiated(
    email_type:,
    enrollment_id:,
    **extra
  )
    track_event(
      'InPerson::EmailReminderJob: Reminder email initiated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      email_type: email_type,
      enrollment_id: enrollment_id,
      **extra,
    )
  end

  # Tracks exceptions that are raised when running InPerson::EmailReminderJob
  # @param [String] enrollment_id
  # @param [String] exception_class
  # @param [String] exception_message
  def idv_in_person_email_reminder_job_exception(
    enrollment_id:,
    exception_class: nil,
    exception_message: nil,
    **extra
  )
    track_event(
      'InPerson::EmailReminderJob: Exception raised when attempting to send reminder email', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_id: enrollment_id,
      exception_class: exception_class,
      exception_message: exception_message,
      **extra,
    )
  end

  # @param [String] selected_location Selected in-person location
  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The user submitted the in person proofing location step
  def idv_in_person_location_submitted(selected_location:, flow_path:,
                                       **extra)
    track_event(
      'IdV: in person proofing location submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      selected_location: selected_location,
      flow_path: flow_path,
      **extra,
    )
  end

  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The user visited the in person proofing location step
  def idv_in_person_location_visited(flow_path:, **extra)
    track_event(
      'IdV: in person proofing location visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      **extra,
    )
  end

  # Tracks if request to get USPS in-person proofing locations fails
  # @param [String] exception_class
  # @param [String] exception_message
  # @param [Boolean] response_body_present
  # @param [Hash] response_body
  # @param [Integer] response_status_code
  def idv_in_person_locations_request_failure(
    exception_class:,
    exception_message:,
    response_body_present:,
    response_body:,
    response_status_code:,
    **extra
  )
    track_event(
      'Request USPS IPP locations: request failed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      exception_class: exception_class,
      exception_message: exception_message,
      response_body_present: response_body_present,
      response_body: response_body,
      response_status_code: response_status_code,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Integer] result_total
  # @param [String] errors
  # @param [String] exception_class
  # @param [String] exception_message
  # @param [Integer] response_status_code
  # User submitted a search on the location search page and response received
  def idv_in_person_locations_searched(
    success:,
    result_total: 0,
    errors: nil,
    exception_class: nil,
    exception_message: nil,
    response_status_code: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing location search submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      result_total: result_total,
      errors: errors,
      exception_class: exception_class,
      exception_message: exception_message,
      response_status_code: response_status_code,
      **extra,
    )
  end

  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The user submitted the in person proofing prepare step
  def idv_in_person_prepare_submitted(flow_path:, **extra)
    track_event(
      'IdV: in person proofing prepare submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      **extra,
    )
  end

  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The user visited the in person proofing prepare step
  def idv_in_person_prepare_visited(flow_path:, **extra)
    track_event('IdV: in person proofing prepare visited', flow_path: flow_path, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] flow_path
  # @param [String] step
  # @param [Integer] step_count
  # @param [String] analytics_id
  # @param [Boolean] irs_reproofing
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean] same_address_as_id
  # address submitted by user
  def idv_in_person_proofing_address_submitted(
    flow_path: nil,
    step: nil,
    step_count: nil,
    analytics_id: nil,
    irs_reproofing: nil,
    success: nil,
    errors: nil,
    same_address_as_id: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing address submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      step: step,
      step_count: step_count,
      analytics_id: analytics_id,
      irs_reproofing: irs_reproofing,
      success: success,
      errors: errors,
      same_address_as_id: same_address_as_id,
      **extra,
    )
  end

  # @param [String] flow_path
  # @param [String] step
  # @param [Integer] step_count
  # @param [String] analytics_id
  # @param [Boolean] irs_reproofing
  # address page visited
  def idv_in_person_proofing_address_visited(
    flow_path: nil,
    step: nil,
    step_count: nil,
    analytics_id: nil,
    irs_reproofing: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing address visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      step: step,
      step_count: step_count,
      analytics_id: analytics_id,
      irs_reproofing: irs_reproofing,
      **extra,
    )
  end

  # @param [String] flow_path
  # @param [String] step
  # @param [Integer] step_count
  # @param [String] analytics_id
  # @param [Boolean] irs_reproofing
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean, nil] same_address_as_id
  # User clicked cancel on update address page
  def idv_in_person_proofing_cancel_update_address(
    flow_path: nil,
    step: nil,
    step_count: nil,
    analytics_id: nil,
    irs_reproofing: nil,
    success: nil,
    errors: nil,
    same_address_as_id: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing cancel_update_address submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      step: step,
      step_count: step_count,
      analytics_id: analytics_id,
      irs_reproofing: irs_reproofing,
      success: success,
      errors: errors,
      same_address_as_id: same_address_as_id,
      **extra,
    )
  end

  # @param [String] flow_path
  # @param [String] step
  # @param [Integer] step_count
  # @param [String] analytics_id
  # @param [Boolean] irs_reproofing
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean] same_address_as_id
  # User clicked cancel on update state id page
  def idv_in_person_proofing_cancel_update_state_id(
    flow_path: nil,
    step: nil,
    step_count: nil,
    analytics_id: nil,
    irs_reproofing: nil,
    success: nil,
    errors: nil,
    same_address_as_id: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing cancel_update_state_id submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      step: step,
      step_count: step_count,
      analytics_id: analytics_id,
      irs_reproofing: irs_reproofing,
      success: success,
      errors: errors,
      same_address_as_id: same_address_as_id,
      **extra,
    )
  end

  # A job to check USPS notifications about in-person enrollment status updates has completed
  # @param [Integer] fetched_items items fetched
  # @param [Integer] processed_items items fetched and processed
  # @param [Integer] deleted_items items fetched, processed, and then deleted from the queue
  # @param [Integer] valid_items items that could be successfully used to update a record
  # @param [Integer] invalid_items items that couldn't be used to update a record
  # @param [Integer] incomplete_items fetched items not processed nor deleted from the queue
  # @param [Integer] deletion_failed_items processed items that we failed to delete
  def idv_in_person_proofing_enrollments_ready_for_status_check_job_completed(
    fetched_items:,
    processed_items:,
    deleted_items:,
    valid_items:,
    invalid_items:,
    incomplete_items:,
    deletion_failed_items:,
    **extra
  )
    track_event(
      'InPersonEnrollmentsReadyForStatusCheckJob: Job completed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      fetched_items:,
      processed_items:,
      deleted_items:,
      valid_items:,
      invalid_items:,
      incomplete_items:,
      deletion_failed_items:,
      **extra,
    )
  end

  # A job to check USPS notifications about in-person enrollment status updates
  # has encountered an error
  # @param [String] exception_class
  # @param [String] exception_message
  def idv_in_person_proofing_enrollments_ready_for_status_check_job_ingestion_error(
    exception_class:,
    exception_message:,
    **extra
  )
    track_event(
      'InPersonEnrollmentsReadyForStatusCheckJob: Ingestion error', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      exception_class:,
      exception_message:,
      **extra,
    )
  end

  # A job to check USPS notifications about in-person enrollment status updates has started
  def idv_in_person_proofing_enrollments_ready_for_status_check_job_started(**extra)
    track_event(
      'InPersonEnrollmentsReadyForStatusCheckJob: Job started', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      **extra,
    )
  end

  # @param [String] nontransliterable_characters
  # Nontransliterable characters submitted by user
  def idv_in_person_proofing_nontransliterable_characters_submitted(
    nontransliterable_characters:,
    **extra
  )
    track_event(
      'IdV: in person proofing characters submitted could not be transliterated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      nontransliterable_characters: nontransliterable_characters,
      **extra,
    )
  end

  # @param [String] flow_path
  # @param [String] step
  # @param [Integer] step_count
  # @param [String] analytics_id
  # @param [Boolean] irs_reproofing
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean] same_address_as_id
  # User submitted state id on redo state id page
  def idv_in_person_proofing_redo_state_id_submitted(
    flow_path: nil,
    step: nil,
    step_count: nil,
    analytics_id: nil,
    irs_reproofing: nil,
    success: nil,
    errors: nil,
    same_address_as_id: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing redo_state_id submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      step: step,
      step_count: step_count,
      analytics_id: analytics_id,
      irs_reproofing: irs_reproofing,
      success: success,
      errors: errors,
      same_address_as_id: same_address_as_id,
      **extra,
    )
  end

  def idv_in_person_proofing_residential_address_submitted(**extra)
    track_event('IdV: in person proofing residential address submitted', **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] flow_path
  # @param [String] step
  # @param [Integer] step_count
  # @param [String] analytics_id
  # @param [Boolean] irs_reproofing
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean, nil] same_address_as_id
  # User submitted state id
  def idv_in_person_proofing_state_id_submitted(
    flow_path: nil,
    step: nil,
    step_count: nil,
    analytics_id: nil,
    irs_reproofing: nil,
    success: nil,
    errors: nil,
    same_address_as_id: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing state_id submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      step: step,
      step_count: step_count,
      analytics_id: analytics_id,
      irs_reproofing: irs_reproofing,
      success: success,
      errors: errors,
      same_address_as_id: same_address_as_id,
      **extra,
    )
  end

  # @param [String] flow_path
  # @param [String] step
  # @param [Integer] step_count
  # @param [String] analytics_id
  # @param [Boolean] irs_reproofing
  # State id page visited
  def idv_in_person_proofing_state_id_visited(
    flow_path: nil,
    step: nil,
    step_count: nil,
    analytics_id: nil,
    irs_reproofing: nil,
    **extra
  )
    track_event(
      'IdV: in person proofing state_id visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      step: step,
      step_count: step_count,
      analytics_id: analytics_id,
      irs_reproofing: irs_reproofing,
      **extra,
    )
  end

  # The user clicked the sp link on the "ready to verify" page
  def idv_in_person_ready_to_verify_sp_link_clicked(**extra)
    track_event(
      'IdV: user clicked sp link on ready to verify page', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user visited the "ready to verify" page for the in person proofing flow
  def idv_in_person_ready_to_verify_visit(proofing_components: nil,
                                          **extra)
    track_event(
      'IdV: in person ready to verify visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # The user clicked the what to bring link on the "ready to verify" page
  def idv_in_person_ready_to_verify_what_to_bring_link_clicked(**extra)
    track_event(
      'IdV: user clicked what to bring link on ready to verify page', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      **extra,
    )
  end

  # Track sms notification attempt
  # @param [boolean] success sms notification successful or not
  # @param [String] enrollment_code enrollment_code
  # @param [String] enrollment_id enrollment_id
  # @param [Hash] telephony_response response from Telephony gem
  # @param [Hash] extra extra information
  def idv_in_person_send_proofing_notification_attempted(
    success:,
    enrollment_code:,
    enrollment_id:,
    telephony_response:,
    **extra
  )
    track_event(
      'SendProofingNotificationJob: in person notification SMS send attempted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      telephony_response: telephony_response,
      **extra,
    )
  end

  # Track sms notification job completion
  # @param [String] enrollment_code enrollment_code
  # @param [String] enrollment_id enrollment_id
  # @param [Hash] extra extra information
  def idv_in_person_send_proofing_notification_job_completed(
    enrollment_code:,
    enrollment_id:,
    **extra
  )
    track_event(
      'SendProofingNotificationJob: job completed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      **extra,
    )
  end

  # Tracks exceptions that are raised when running InPerson::SendProofingNotificationJob
  # @param [String] enrollment_code
  # @param [String] enrollment_id
  # @param [String] exception_class
  # @param [String] exception_message
  # @param [Hash] extra extra information
  def idv_in_person_send_proofing_notification_job_exception(
    enrollment_code:,
    enrollment_id:,
    exception_class: nil,
    exception_message: nil,
    **extra
  )
    track_event(
      'SendProofingNotificationJob: exception raised', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      exception_class: exception_class,
      exception_message: exception_message,
      **extra,
    )
  end

  # Track sms notification job skipped
  # @param [String] enrollment_code enrollment_code
  # @param [String] enrollment_id enrollment_id
  # @param [Hash] extra extra information
  def idv_in_person_send_proofing_notification_job_skipped(
    enrollment_code:,
    enrollment_id:,
    **extra
  )
    track_event(
      'SendProofingNotificationJob: job skipped', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      **extra,
    )
  end

  # Track sms notification job started
  # @param [String] enrollment_code enrollment_code
  # @param [String] enrollment_id enrollment_id
  # @param [Hash] extra extra information
  def idv_in_person_send_proofing_notification_job_started(
    enrollment_code:,
    enrollment_id:,
    **extra
  )
    track_event(
      'SendProofingNotificationJob: job started', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      **extra,
    )
  end

  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The user submitted the in person proofing switch_back step
  def idv_in_person_switch_back_submitted(flow_path:, **extra)
    track_event('IdV: in person proofing switch_back submitted', flow_path: flow_path, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The user visited the in person proofing switch_back step
  def idv_in_person_switch_back_visited(flow_path:, **extra)
    track_event('IdV: in person proofing switch_back visited', flow_path: flow_path, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # An email from USPS with an enrollment code has been received, indicating
  # the enrollment is approved or failed. A check is required to get the status
  # it is not included in the email.
  # @param [boolean] multi_part If the email is marked as multi_part
  # @param [string] part_found Records if the enrollment code was found in text_part or html_part
  def idv_in_person_usps_proofing_enrollment_code_email_received(
    multi_part: nil,
    part_found: nil,
    **extra
  )
    track_event(
      'IdV: in person usps proofing enrollment code email received', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      multi_part: multi_part,
      part_found: part_found,
      **extra,
    )
  end

  # GetUspsProofingResultsJob has completed. Includes counts of various outcomes encountered
  # @param [Float] duration_seconds number of minutes the job was running
  # @param [Integer] enrollments_checked number of enrollments eligible for status check
  # @param [Integer] enrollments_errored number of enrollments for which we encountered an error
  # @param [Integer] enrollments_expired number of enrollments which expired
  # @param [Integer] enrollments_failed number of enrollments which failed identity proofing
  # @param [Integer] enrollments_in_progress number of enrollments which did not have any change
  # @param [Integer] enrollments_passed number of enrollments which passed identity proofing
  def idv_in_person_usps_proofing_results_job_completed(
    duration_seconds:,
    enrollments_checked:,
    enrollments_errored:,
    enrollments_expired:,
    enrollments_failed:,
    enrollments_in_progress:,
    enrollments_passed:,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Job completed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      duration_seconds: duration_seconds,
      enrollments_checked: enrollments_checked,
      enrollments_errored: enrollments_errored,
      enrollments_expired: enrollments_expired,
      enrollments_failed: enrollments_failed,
      enrollments_in_progress: enrollments_in_progress,
      enrollments_passed: enrollments_passed,
      **extra,
    )
  end

  # Tracks exceptions that are raised when initiating deadline email in GetUspsProofingResultsJob
  # @param [String] enrollment_id
  # @param [String] exception_class
  # @param [String] exception_message
  def idv_in_person_usps_proofing_results_job_deadline_passed_email_exception(
    enrollment_id:,
    exception_class: nil,
    exception_message: nil,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Exception raised when attempting to send deadline passed email', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_id: enrollment_id,
      exception_class: exception_class,
      exception_message: exception_message,
      **extra,
    )
  end

  # Tracks deadline email initiated during GetUspsProofingResultsJob
  # @param [String] enrollment_id
  def idv_in_person_usps_proofing_results_job_deadline_passed_email_initiated(
    enrollment_id:,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: deadline passed email initiated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_id: enrollment_id,
      **extra,
    )
  end

  # Tracks emails that are initiated during GetUspsProofingResultsJob
  # @param [String] email_type success, failed or failed fraud
  def idv_in_person_usps_proofing_results_job_email_initiated(
    email_type:,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Success or failure email initiated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      email_type: email_type,
      **extra,
    )
  end

  # Tracks incomplete enrollments checked via the USPS API
  # @param [String] enrollment_code
  # @param [String] enrollment_id
  # @param [Float] minutes_since_established
  # @param [String] response_message
  def idv_in_person_usps_proofing_results_job_enrollment_incomplete(
    enrollment_code:,
    enrollment_id:,
    minutes_since_established:,
    response_message:,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Enrollment incomplete', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      minutes_since_established: minutes_since_established,
      response_message: response_message,
      **extra,
    )
  end

  # Tracks individual enrollments that are updated during GetUspsProofingResultsJob
  # @param [String] enrollment_code
  # @param [String] enrollment_id
  # @param [Float] minutes_since_established
  # @param [Boolean] fraud_suspected
  # @param [Boolean] passed did this enrollment pass or fail?
  # @param [String] reason why did this enrollment pass or fail?
  def idv_in_person_usps_proofing_results_job_enrollment_updated(
    enrollment_code:,
    enrollment_id:,
    minutes_since_established:,
    fraud_suspected:,
    passed:,
    reason:,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Enrollment status updated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      minutes_since_established: minutes_since_established,
      fraud_suspected: fraud_suspected,
      passed: passed,
      reason: reason,
      **extra,
    )
  end

  # Tracks exceptions that are raised when running GetUspsProofingResultsJob
  # @param [String] reason why was the exception raised?
  # @param [String] enrollment_id
  # @param [String] exception_class
  # @param [String] exception_message
  # @param [String] enrollment_code
  # @param [Float] minutes_since_established
  # @param [Float] minutes_since_last_status_check
  # @param [Float] minutes_since_last_status_update
  # @param [Float] minutes_to_completion
  # @param [Boolean] fraud_suspected
  # @param [String] primary_id_type
  # @param [String] secondary_id_type
  # @param [String] failure_reason
  # @param [String] transaction_end_date_time
  # @param [String] transaction_start_date_time
  # @param [String] status
  # @param [String] assurance_level
  # @param [String] proofing_post_office
  # @param [String] proofing_city
  # @param [String] proofing_state
  # @param [String] scan_count
  # @param [String] response_message
  # @param [Integer] response_status_code
  def idv_in_person_usps_proofing_results_job_exception(
    reason:,
    enrollment_id:,
    minutes_since_established:,
    exception_class: nil,
    exception_message: nil,
    enrollment_code: nil,
    minutes_since_last_status_check: nil,
    minutes_since_last_status_update: nil,
    minutes_to_completion: nil,
    fraud_suspected: nil,
    primary_id_type: nil,
    secondary_id_type: nil,
    failure_reason: nil,
    transaction_end_date_time: nil,
    transaction_start_date_time: nil,
    status: nil,
    assurance_level: nil,
    proofing_post_office: nil,
    proofing_city: nil,
    proofing_state: nil,
    scan_count: nil,
    response_message: nil,
    response_status_code: nil,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Exception raised', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      reason: reason,
      enrollment_id: enrollment_id,
      exception_class: exception_class,
      exception_message: exception_message,
      enrollment_code: enrollment_code,
      minutes_since_established: minutes_since_established,
      minutes_since_last_status_check: minutes_since_last_status_check,
      minutes_since_last_status_update: minutes_since_last_status_update,
      minutes_to_completion: minutes_to_completion,
      fraud_suspected: fraud_suspected,
      primary_id_type: primary_id_type,
      secondary_id_type: secondary_id_type,
      failure_reason: failure_reason,
      transaction_end_date_time: transaction_end_date_time,
      transaction_start_date_time: transaction_start_date_time,
      status: status,
      assurance_level: assurance_level,
      proofing_post_office: proofing_post_office,
      proofing_city: proofing_city,
      proofing_state: proofing_state,
      scan_count: scan_count,
      response_message: response_message,
      response_status_code: response_status_code,
      **extra,
    )
  end

  # GetUspsProofingResultsJob is beginning. Includes some metadata about what the job will do
  # @param [Integer] enrollments_count number of enrollments eligible for status check
  # @param [Integer] reprocess_delay_minutes minimum delay since last status check
  def idv_in_person_usps_proofing_results_job_started(
    enrollments_count:,
    reprocess_delay_minutes:,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Job started', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollments_count: enrollments_count,
      reprocess_delay_minutes: reprocess_delay_minutes,
      **extra,
    )
  end

  # Tracks unexpected responses from the USPS API
  # @param [String] enrollment_code
  # @param [String] enrollment_id
  # @param [Float] minutes_since_established
  # @param [String] response_message
  # @param [String] reason why was this error unexpected?
  def idv_in_person_usps_proofing_results_job_unexpected_response(
    enrollment_code:,
    enrollment_id:,
    minutes_since_established:,
    response_message:,
    reason:,
    **extra
  )
    track_event(
      'GetUspsProofingResultsJob: Unexpected response received', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      minutes_since_established: minutes_since_established,
      response_message: response_message,
      reason: reason,
      **extra,
    )
  end

  # Tracks if USPS in-person proofing enrollment request fails
  # @param [String] context
  # @param [String] reason
  # @param [Integer] enrollment_id
  # @param [String] exception_class
  # @param [String] exception_message
  def idv_in_person_usps_request_enroll_exception(
    context:,
    reason:,
    enrollment_id:,
    exception_class:,
    exception_message:,
    **extra
  )
    track_event(
      'USPS IPPaaS enrollment failed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      context: context,
      enrollment_id: enrollment_id,
      exception_class: exception_class,
      exception_message: exception_message,
      reason: reason,
      **extra,
    )
  end

  # User visits IdV
  def idv_intro_visit
    track_event('IdV: intro visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # The user visited the "letter enqueued" page shown during the verify by mail flow
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # @identity.idp.previous_event_name IdV: come back later visited
  def idv_letter_enqueued_visit(proofing_components: nil, **extra)
    track_event(
      'IdV: letter enqueued visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  def idv_link_sent_capture_doc_polling_complete(**_extra)
    track_event(
      'Frontend: IdV: Link sent capture doc polling complete', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  def idv_link_sent_capture_doc_polling_started(**_extra)
    track_event(
      'Frontend: IdV: Link sent capture doc polling started', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # Tracks when the user visits Mail only warning when vendor_status_sms is set to full_outage
  def idv_mail_only_warning_visited(**extra)
    track_event(
      'IdV: Mail only warning visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      **extra,
    )
  end

  # Tracks whether the user's device appears to be mobile device with a camera attached.
  # @param [Boolean] is_camera_capable_mobile Whether we think the device _could_ have a camera.
  # @param [Boolean,nil] camera_present Whether the user's device _actually_ has a camera available.
  # @param [Integer,nil] grace_time Extra time allowed for browser to report camera availability.
  # @param [Integer,nil] duration Time taken for browser to report camera availability.
  def idv_mobile_device_and_camera_check(
    is_camera_capable_mobile:,
    camera_present: nil,
    grace_time: nil,
    duration: nil,
    **extra
  )
    track_event(
      'IdV: Mobile device and camera check', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      is_camera_capable_mobile: is_camera_capable_mobile,
      camera_present: camera_present,
      grace_time: grace_time,
      duration: duration,
      **extra,
    )
  end

  # @param [Integer] failed_capture_attempts Number of failed Acuant SDK attempts
  # @param [Integer] failed_submission_attempts Number of failed Acuant doc submissions
  # @param [String] field Image form field
  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The number of acceptable failed attempts (maxFailedAttemptsBeforeNativeCamera) has been met
  # or exceeded, and the system has forced the use of the native camera, rather than Acuant's
  # camera, on mobile devices.
  def idv_native_camera_forced(
    failed_capture_attempts:,
    failed_submission_attempts:,
    field:,
    flow_path:,
    **extra
  )
    track_event(
      'IdV: Native camera forced after failed attempts', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      failed_capture_attempts: failed_capture_attempts,
      failed_submission_attempts: failed_submission_attempts,
      field: field,
      flow_path: flow_path,
      **extra,
    )
  end

  # Tracks when user reaches verify errors due to being rejected due to fraud
  def idv_not_verified_visited
    track_event('IdV: Not verified visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks if a user clicks the 'acknowledge' checkbox during personal
  # key creation
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # @param [boolean] checked whether the user checked or un-checked
  #                  the box with this click
  def idv_personal_key_acknowledgment_toggled(checked:, proofing_components:, **extra)
    track_event(
      'IdV: personal key acknowledgment toggled', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      checked: checked,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # A user has downloaded their personal key. This event is no longer emitted.
  # @identity.idp.previous_event_name IdV: download personal key
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  def idv_personal_key_downloaded(proofing_components: nil, **extra)
    track_event(
      'IdV: personal key downloaded', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # @param [String, nil] deactivation_reason Reason profile was deactivated.
  # @param [Boolean] fraud_review_pending Profile is under review for fraud
  # @param [Boolean] fraud_rejection Profile is rejected due to fraud
  # @param [Boolean] in_person_verification_pending Profile is pending in-person verification
  # User submitted IDV personal key page
  def idv_personal_key_submitted(
    fraud_review_pending:,
    fraud_rejection:,
    in_person_verification_pending:,
    proofing_components: nil,
    deactivation_reason: nil,
    **extra
  )
    track_event(
      'IdV: personal key submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      in_person_verification_pending: in_person_verification_pending,
      deactivation_reason: deactivation_reason,
      fraud_review_pending: fraud_review_pending,
      fraud_rejection: fraud_rejection,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # User visited IDV personal key page
  def idv_personal_key_visited(proofing_components: nil, **extra)
    track_event(
      'IdV: personal key visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param ["sms", "voice"] otp_delivery_preference
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user submitted their phone on the phone confirmation page
  def idv_phone_confirmation_form_submitted(
    success:,
    otp_delivery_preference:,
    errors:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: phone confirmation form', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      otp_delivery_preference: otp_delivery_preference,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user was rate limited for submitting too many OTPs during the IDV phone step
  def idv_phone_confirmation_otp_rate_limit_attempts(proofing_components: nil, **extra)
    track_event(
      'Idv: Phone OTP attempts rate limited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user was locked out for hitting the phone OTP rate limit during IDV
  def idv_phone_confirmation_otp_rate_limit_locked_out(proofing_components: nil, **extra)
    track_event(
      'Idv: Phone OTP rate limited user', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user was rate limited for requesting too many OTPs during the IDV phone step
  def idv_phone_confirmation_otp_rate_limit_sends(proofing_components: nil, **extra)
    track_event(
      'Idv: Phone OTP sends rate limited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param ["sms","voice"] otp_delivery_preference which channel the OTP was delivered by
  # @param [String] country_code country code of phone number
  # @param [String] area_code area code of phone number
  # @param [Boolean] rate_limit_exceeded whether or not the rate limit was exceeded by this attempt
  # @param [Hash] telephony_response response from Telephony gem
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The user resent an OTP during the IDV phone step
  def idv_phone_confirmation_otp_resent(
    success:,
    errors:,
    otp_delivery_preference:,
    country_code:,
    area_code:,
    rate_limit_exceeded:,
    telephony_response:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: phone confirmation otp resent', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      otp_delivery_preference: otp_delivery_preference,
      country_code: country_code,
      area_code: area_code,
      rate_limit_exceeded: rate_limit_exceeded,
      telephony_response: telephony_response,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param ["sms","voice"] otp_delivery_preference which channel the OTP was delivered by
  # @param [String] country_code country code of phone number
  # @param [String] area_code area code of phone number
  # @param [Boolean] rate_limit_exceeded whether or not the rate limit was exceeded by this attempt
  # @param [String] phone_fingerprint the hmac fingerprint of the phone number formatted as e164
  # @param [Hash] telephony_response response from Telephony gem
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # @param [:test, :pinpoint] adapter which adapter the OTP was delivered with
  # The user requested an OTP to confirm their phone during the IDV phone step
  def idv_phone_confirmation_otp_sent(
    success:,
    errors:,
    otp_delivery_preference:,
    country_code:,
    area_code:,
    rate_limit_exceeded:,
    phone_fingerprint:,
    telephony_response:,
    adapter:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: phone confirmation otp sent', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      otp_delivery_preference: otp_delivery_preference,
      country_code: country_code,
      area_code: area_code,
      rate_limit_exceeded: rate_limit_exceeded,
      phone_fingerprint: phone_fingerprint,
      telephony_response: telephony_response,
      adapter: adapter,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean] code_expired if the one-time code expired
  # @param [Boolean] code_matches
  # @param [Integer] second_factor_attempts_count number of attempts to confirm this phone
  # @param [Time, nil] second_factor_locked_at timestamp when the phone was locked out
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # When a user attempts to confirm posession of a new phone number during the IDV process
  def idv_phone_confirmation_otp_submitted(
    success:,
    errors:,
    code_expired:,
    code_matches:,
    second_factor_attempts_count:,
    second_factor_locked_at:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: phone confirmation otp submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      code_expired: code_expired,
      code_matches: code_matches,
      second_factor_attempts_count: second_factor_attempts_count,
      second_factor_locked_at: second_factor_locked_at,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # When a user visits the page to confirm posession of a new phone number during the IDV process
  def idv_phone_confirmation_otp_visit(proofing_components: nil, **extra)
    track_event(
      'IdV: phone confirmation otp visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The vendor finished the process of confirming the users phone
  def idv_phone_confirmation_vendor_submitted(
    success:,
    errors:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: phone confirmation vendor', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param ['warning','jobfail','failure'] type
  # @param [Time] limiter_expires_at when the rate limit expires
  # @param [Integer] remaining_attempts number of attempts remaining
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # When a user gets an error during the phone finder flow of IDV
  def idv_phone_error_visited(
    type:,
    proofing_components: nil,
    limiter_expires_at: nil,
    remaining_attempts: nil,
    **extra
  )
    track_event(
      'IdV: phone error visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        type: type,
        proofing_components: proofing_components,
        limiter_expires_at: limiter_expires_at,
        remaining_attempts: remaining_attempts,
        **extra,
      }.compact,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # User visited idv phone of record
  def idv_phone_of_record_visited(proofing_components: nil, **extra)
    track_event(
      'IdV: phone of record visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param ["sms", "voice"] otp_delivery_preference
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Hash] error_details
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  def idv_phone_otp_delivery_selection_submitted(
    success:,
    otp_delivery_preference:,
    proofing_components: nil,
    errors: nil,
    error_details: nil,
    **extra
  )
    track_event(
      'IdV: Phone OTP Delivery Selection Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        success: success,
        errors: errors,
        error_details: error_details,
        otp_delivery_preference: otp_delivery_preference,
        proofing_components: proofing_components,
        **extra,
      }.compact,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # User visited idv phone OTP delivery selection
  def idv_phone_otp_delivery_selection_visit(proofing_components: nil, **extra)
    track_event(
      'IdV: Phone OTP delivery Selection Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # @param [String] step the step the user was on when they clicked use a different phone number
  # User decided to use a different phone number in idv
  def idv_phone_use_different(step:, proofing_components: nil, **extra)
    track_event(
      'IdV: use different phone number', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      step: step,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @identity.idp.previous_event_name IdV: Verify setup errors visited
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # Tracks when the user reaches the verify please call page after failing proofing
  def idv_please_call_visited(proofing_components: nil, **extra)
    track_event(
      'IdV: Verify please call visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # The system encountered an error and the proofing results are missing
  def idv_proofing_resolution_result_missing(proofing_components: nil, **extra)
    track_event(
      'IdV: proofing resolution result missing', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      proofing_components: proofing_components,
      **extra,
    )
  end

  # @param [Boolean] letter_already_sent
  # GPO "request letter" page visited
  # @identity.idp.previous_event_name IdV: USPS address visited
  def idv_request_letter_visited(
    letter_already_sent:,
    **extra
  )
    track_event(
      'IdV: request letter visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      letter_already_sent: letter_already_sent,
      **extra,
    )
  end

  # Tracks when the user visits one of the the session error pages.
  # @param [String] type
  # @param [Integer,nil] attempts_remaining
  def idv_session_error_visited(
    type:,
    attempts_remaining: nil,
    **extra
  )
    track_event(
      'IdV: session error visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      type: type,
      attempts_remaining: attempts_remaining,
      **extra,
    )
  end

  # @param [String] step
  # @param [String] location
  # @param [Idv::ProofingComponentsLogging] proofing_components User's current proofing components
  # User started over idv
  def idv_start_over(
    step:,
    location:,
    proofing_components: nil,
    **extra
  )
    track_event(
      'IdV: start over', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      step: step,
      location: location,
      proofing_components: proofing_components,
      **extra,
    )
  end

  # Track when USPS auth token refresh job completed
  def idv_usps_auth_token_refresh_job_completed(**extra)
    track_event(
      'UspsAuthTokenRefreshJob: Completed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      **extra,
    )
  end

  # Track when USPS auth token refresh job encounters a network error
  # @param [String] exception_class
  # @param [String] exception_message
  def idv_usps_auth_token_refresh_job_network_error(exception_class:, exception_message:, **extra)
    track_event(
      'UspsAuthTokenRefreshJob: Network error', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      exception_class: exception_class,
      exception_message: exception_message,
      **extra,
    )
  end

  # Track when USPS auth token refresh job started
  def idv_usps_auth_token_refresh_job_started(**extra)
    track_event(
      'UspsAuthTokenRefreshJob: Started', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      **extra,
    )
  end

  # @identity.idp.previous_event_name Account verification submitted
  # @identity.idp.previous_event_name IdV: GPO verification submitted
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Hash] pii_like_keypaths
  # @param [DateTime] enqueued_at When was this letter enqueued
  # @param [Integer] which_letter Sorted by enqueue time, which letter had this code
  # @param [Integer] letter_count How many letters did the user enqueue for this profile
  # @param [Integer] attempts Number of attempts to enter a correct code
  # @param [Boolean] pending_in_person_enrollment
  # @param [Boolean] fraud_check_failed
  # @see Reporting::IdentityVerificationReport#query This event is used by the identity verification
  #       report. Changes here should be reflected there.
  # GPO verification submitted
  def idv_verify_by_mail_enter_code_submitted(
    success:,
    errors:,
    pii_like_keypaths:,
    enqueued_at:,
    which_letter:,
    letter_count:,
    attempts:,
    pending_in_person_enrollment:,
    fraud_check_failed:,
    **extra
  )
    track_event(
      'IdV: enter verify by mail code submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      pii_like_keypaths: pii_like_keypaths,
      enqueued_at: enqueued_at,
      which_letter: which_letter,
      letter_count: letter_count,
      attempts: attempts,
      pending_in_person_enrollment: pending_in_person_enrollment,
      fraud_check_failed: fraud_check_failed,
      **extra,
    )
  end

  # @identity.idp.previous_event_name Account verification visited
  # @identity.idp.previous_event_name IdV: GPO verification visited
  # Visited page used to enter address verification code received via US mail.
  # @param [String,nil] source The source for the visit (i.e., "gpo_reminder_email").
  def idv_verify_by_mail_enter_code_visited(
    source: nil,
    **extra
  )
    track_event(
      'IdV: enter verify by mail code visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      source: source,
      **extra,
    )
  end

  # @param [String] flow_path Document capture path ("hybrid" or "standard")
  # The user clicked the troubleshooting option to start in-person proofing
  def idv_verify_in_person_troubleshooting_option_clicked(flow_path:,
                                                          **extra)
    track_event(
      'IdV: verify in person troubleshooting option clicked', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flow_path: flow_path,
      **extra,
    )
  end

  def idv_warning_action_triggered(**_extra)
    track_event(
      'Frontend: IdV: warning action triggered', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  def idv_warning_shown(**_extra)
    track_event(
      'Frontend: IdV: warning shown', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # @param [String] controller
  # @param [Boolean] user_signed_in
  # Authenticity token (CSRF) is invalid
  def invalid_authenticity_token(
    controller:,
    user_signed_in: nil,
    **extra
  )
    track_event(
      'Invalid Authenticity Token', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      controller: controller,
      user_signed_in: user_signed_in,
      **extra,
    )
  end

  # @param [Integer] rendered_event_count how many events were rendered in the API response
  # @param [Boolean] authenticated whether the request was successfully authenticated
  # @param [Float] elapsed_time the amount of time the function took to run
  # @param [Boolean] success
  # An IRS Attempt API client has requested events
  def irs_attempts_api_events(
    rendered_event_count:,
    authenticated:,
    elapsed_time:,
    success:,
    **extra
  )
    track_event(
      'IRS Attempt API: Events submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      rendered_event_count: rendered_event_count,
      authenticated: authenticated,
      elapsed_time: elapsed_time,
      success: success,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [String] client_id
  # @param [Boolean] client_id_parameter_present
  # @param [Boolean] id_token_hint_parameter_present
  # @param [Boolean] sp_initiated
  # @param [Boolean] oidc
  # @param [Boolean] saml_request_valid
  # @param [Hash] errors
  # @param [Hash] error_details
  # @param [String] method
  # Logout Initiated
  def logout_initiated(
    success: nil,
    client_id: nil,
    sp_initiated: nil,
    oidc: nil,
    client_id_parameter_present: nil,
    id_token_hint_parameter_present: nil,
    saml_request_valid: nil,
    errors: nil,
    error_details: nil,
    method: nil,
    **extra
  )
    track_event(
      'Logout Initiated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      client_id: client_id,
      client_id_parameter_present: client_id_parameter_present,
      id_token_hint_parameter_present: id_token_hint_parameter_present,
      errors: errors,
      error_details: error_details,
      sp_initiated: sp_initiated,
      oidc: oidc,
      saml_request_valid: saml_request_valid,
      method: method,
      **extra,
    )
  end

  # @param [Boolean] success Whether authentication was successful
  # @param [Hash] errors Authentication error reasons, if unsuccessful
  # @param [String] context
  # @param [String] multi_factor_auth_method
  # @param [DateTime] multi_factor_auth_method_created_at time auth method was created
  # @param [Integer] auth_app_configuration_id
  # @param [Integer] piv_cac_configuration_id
  # @param [Integer] key_id
  # @param [Integer] webauthn_configuration_id
  # @param [Integer] phone_configuration_id
  # @param [Boolean] confirmation_for_add_phone
  # @param [String] area_code
  # @param [String] country_code
  # @param [String] phone_fingerprint the hmac fingerprint of the phone number formatted as e164
  # Multi-Factor Authentication
  def multi_factor_auth(
    success:,
    errors: nil,
    context: nil,
    multi_factor_auth_method: nil,
    multi_factor_auth_method_created_at: nil,
    auth_app_configuration_id: nil,
    piv_cac_configuration_id: nil,
    key_id: nil,
    webauthn_configuration_id: nil,
    confirmation_for_add_phone: nil,
    phone_configuration_id: nil,
    pii_like_keypaths: nil,
    area_code: nil,
    country_code: nil,
    phone_fingerprint: nil,
    **extra
  )
    track_event(
      'Multi-Factor Authentication', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      context: context,
      multi_factor_auth_method: multi_factor_auth_method,
      multi_factor_auth_method_created_at: multi_factor_auth_method_created_at,
      auth_app_configuration_id: auth_app_configuration_id,
      piv_cac_configuration_id: piv_cac_configuration_id,
      key_id: key_id,
      webauthn_configuration_id: webauthn_configuration_id,
      confirmation_for_add_phone: confirmation_for_add_phone,
      phone_configuration_id: phone_configuration_id,
      pii_like_keypaths: pii_like_keypaths,
      area_code: area_code,
      country_code: country_code,
      phone_fingerprint: phone_fingerprint,
      **extra,
    )
  end

  # Tracks when the the user has added the MFA method phone to their account
  # @param [Integer] enabled_mfa_methods_count number of registered mfa methods for the user
  def multi_factor_auth_added_phone(enabled_mfa_methods_count:, **extra)
    track_event(
      'Multi-Factor Authentication: Added phone', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        method_name: :phone,
        enabled_mfa_methods_count: enabled_mfa_methods_count,
        **extra,
      }.compact,
    )
  end

  # @identity.idp.previous_event_name Multi-Factor Authentication: Added PIV_CAC
  # Tracks when the user has added the MFA method piv_cac to their account
  # @param [Integer] enabled_mfa_methods_count number of registered mfa methods for the user
  # @param [Boolean] in_account_creation_flow whether user is going through creation flow
  def multi_factor_auth_added_piv_cac(enabled_mfa_methods_count:, in_account_creation_flow:,
                                      **extra)
    track_event(
      :multi_factor_auth_added_piv_cac,
      {
        method_name: :piv_cac,
        enabled_mfa_methods_count:,
        in_account_creation_flow:,
        **extra,
      }.compact,
    )
  end

  # Tracks when the user has added the MFA method TOTP to their account
  # @param [Integer] enabled_mfa_methods_count number of registered mfa methods for the user
  # @param [Boolean] in_account_creation_flow whether user is going through creation flow
  def multi_factor_auth_added_totp(enabled_mfa_methods_count:, in_account_creation_flow:,
                                   **extra)
    track_event(
      'Multi-Factor Authentication: Added TOTP', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        method_name: :totp,
        in_account_creation_flow:,
        enabled_mfa_methods_count:,
        **extra,
      }.compact,
    )
  end

  # Tracks when the user has added the MFA method webauthn to their account
  # @param [Boolean] platform_authenticator indicates if webauthn_platform was used
  # @param [Integer] enabled_mfa_methods_count number of registered mfa methods for the user
  def multi_factor_auth_added_webauthn(
    platform_authenticator:,
    enabled_mfa_methods_count:, **extra
  )
    track_event(
      'Multi-Factor Authentication: Added webauthn', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        method_name: :webauthn,
        platform_authenticator: platform_authenticator,
        enabled_mfa_methods_count: enabled_mfa_methods_count,
        **extra,
      }.compact,
    )
  end

  # A user has downloaded their backup codes
  def multi_factor_auth_backup_code_download
    track_event('Multi-Factor Authentication: download backup code') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks when the user visits the backup code confirmation setup page
  # @param [Integer] enabled_mfa_methods_count number of registered mfa methods for the user
  # @param [Boolean] in_account_creation_flow whether user is going through creation flow
  def multi_factor_auth_enter_backup_code_confirmation_visit(
    enabled_mfa_methods_count:,
    in_account_creation_flow:,
    **extra
  )
    track_event(
      'Multi-Factor Authentication: enter backup code confirmation visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        enabled_mfa_methods_count:,
        in_account_creation_flow:,
        **extra,
      }.compact,
    )
  end

  # @param ["authentication","reauthentication","confirmation"] context user session context
  # User visited the page to enter a backup code as their MFA
  def multi_factor_auth_enter_backup_code_visit(context:, **extra)
    track_event(
      'Multi-Factor Authentication: enter backup code visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      context: context,
      **extra,
    )
  end

  # @param [String] context
  # @param [String] multi_factor_auth_method
  # @param [Boolean] confirmation_for_add_phone
  # @param [Integer] phone_configuration_id
  # Multi-Factor Authentication enter OTP visited
  def multi_factor_auth_enter_otp_visit(
    context:,
    multi_factor_auth_method:,
    confirmation_for_add_phone:,
    phone_configuration_id:,
    **extra
  )
    track_event(
      'Multi-Factor Authentication: enter OTP visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      context: context,
      multi_factor_auth_method: multi_factor_auth_method,
      confirmation_for_add_phone: confirmation_for_add_phone,
      phone_configuration_id: phone_configuration_id,
      **extra,
    )
  end

  # @param ["authentication","reauthentication","confirmation"] context user session context
  # User visited the page to enter a personal key as their mfa (legacy flow)
  def multi_factor_auth_enter_personal_key_visit(context:, **extra)
    track_event(
      'Multi-Factor Authentication: enter personal key visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      context: context,
      **extra,
    )
  end

  # @identity.idp.previous_event_name 'Multi-Factor Authentication: enter PIV CAC visited'
  # @param ["authentication","reauthentication","confirmation"] context user session context
  # @param ["piv_cac"] multi_factor_auth_method
  # @param [Integer, nil] piv_cac_configuration_id PIV/CAC configuration database ID
  # User used a PIV/CAC as their mfa
  def multi_factor_auth_enter_piv_cac(
    context:,
    multi_factor_auth_method:,
    piv_cac_configuration_id:,
    **extra
  )
    track_event(
      :multi_factor_auth_enter_piv_cac,
      context: context,
      multi_factor_auth_method: multi_factor_auth_method,
      piv_cac_configuration_id: piv_cac_configuration_id,
      **extra,
    )
  end

  # @param ["authentication","reauthentication","confirmation"] context user session context
  # User visited the page to enter a TOTP as their mfa
  def multi_factor_auth_enter_totp_visit(context:, **extra)
    track_event('Multi-Factor Authentication: enter TOTP visited', context: context, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param ["authentication","reauthentication","confirmation"] context user session context
  # @param ["webauthn","webauthn_platform"] multi_factor_auth_method which webauthn method was used,
  # webauthn means a roaming authenticator like a yubikey, webauthn_platform means a platform
  # authenticator like face or touch ID
  # @param [Integer, nil] webauthn_configuration_id webauthn database ID
  # User visited the page to authenticate with webauthn (yubikey, face ID or touch ID)
  def multi_factor_auth_enter_webauthn_visit(
    context:,
    multi_factor_auth_method:,
    webauthn_configuration_id:,
    **extra
  )
    track_event(
      'Multi-Factor Authentication: enter webAuthn authentication visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      context: context,
      multi_factor_auth_method: multi_factor_auth_method,
      webauthn_configuration_id: webauthn_configuration_id,
      **extra,
    )
  end

  # Max multi factor auth attempts met
  def multi_factor_auth_max_attempts
    track_event('Multi-Factor Authentication: max attempts reached') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Max multi factor max otp sends reached
  def multi_factor_auth_max_sends
    track_event('Multi-Factor Authentication: max otp sends reached') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Multi factor selected from auth options list
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] selection
  def multi_factor_auth_option_list(success:, errors:, selection:, **extra)
    track_event(
      'Multi-Factor Authentication: option list', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      selection: selection,
      **extra,
    )
  end

  # User visited the list of multi-factor options to use
  def multi_factor_auth_option_list_visit
    track_event('Multi-Factor Authentication: option list visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Multi factor auth phone setup
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] otp_delivery_preference
  # @param [String] area_code
  # @param [String] carrier
  # @param [String] country_code
  # @param [String] phone_type
  # @param [Hash] types
  def multi_factor_auth_phone_setup(success:,
                                    errors:,
                                    otp_delivery_preference:,
                                    area_code:,
                                    carrier:,
                                    country_code:,
                                    phone_type:,
                                    types:,
                                    **extra)
    track_event(
      'Multi-Factor Authentication: phone setup', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      otp_delivery_preference: otp_delivery_preference,
      area_code: area_code,
      carrier: carrier,
      country_code: country_code,
      phone_type: phone_type,
      types: types,
      **extra,
    )
  end

  # Tracks when a user sets up a multi factor auth method
  # @param [Boolean] success Whether authenticator setup was successful
  # @param [Hash] errors Authenticator setup error reasons, if unsuccessful
  # @param [String] multi_factor_auth_method
  # @param [Boolean] in_account_creation_flow whether user is going through account creation flow
  # @param [integer] enabled_mfa_methods_count
  def multi_factor_auth_setup(
    success:,
    multi_factor_auth_method:,
    enabled_mfa_methods_count:,
    in_account_creation_flow:,
    errors: nil,
    **extra
  )
    track_event(
      'Multi-Factor Authentication Setup', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      multi_factor_auth_method: multi_factor_auth_method,
      in_account_creation_flow: in_account_creation_flow,
      enabled_mfa_methods_count: enabled_mfa_methods_count,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [String] exception
  # @param [Integer] user_id
  # A user was migrated from a single-region key to a multi-region key
  def multi_region_kms_migration_user_migrated(
    success:,
    exception:,
    user_id:,
    **extra
  )
    track_event(
      'Multi-region KMS migration: User migrated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      exception: exception,
      user_id: user_id,
      **extra,
    )
  end

  # @param [Integer] user_count
  # @param [Integer] success_count
  # @param [Integer] error_count
  # The user migration job finished running
  def multi_region_kms_migration_user_migration_summary(
    user_count:,
    success_count:,
    error_count:,
    **extra
  )
    track_event(
      'Multi-region KMS migration: User migration summary', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      user_count: user_count,
      success_count: success_count,
      error_count: error_count,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [String] client_id
  # @param [Boolean] client_id_parameter_present
  # @param [Boolean] id_token_hint_parameter_present
  # @param [Boolean] sp_initiated
  # @param [Boolean] oidc
  # @param [Boolean] saml_request_valid
  # @param [Hash] errors
  # @param [Hash] error_details
  # @param [String] method
  # OIDC Logout Requested
  def oidc_logout_requested(
    success: nil,
    client_id: nil,
    sp_initiated: nil,
    oidc: nil,
    client_id_parameter_present: nil,
    id_token_hint_parameter_present: nil,
    saml_request_valid: nil,
    errors: nil,
    error_details: nil,
    method: nil,
    **extra
  )
    track_event(
      'OIDC Logout Requested', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      client_id: client_id,
      client_id_parameter_present: client_id_parameter_present,
      id_token_hint_parameter_present: id_token_hint_parameter_present,
      errors: errors,
      error_details: error_details,
      sp_initiated: sp_initiated,
      oidc: oidc,
      saml_request_valid: saml_request_valid,
      method: method,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [String] client_id
  # @param [Boolean] client_id_parameter_present
  # @param [Boolean] id_token_hint_parameter_present
  # @param [Boolean] sp_initiated
  # @param [Boolean] oidc
  # @param [Boolean] saml_request_valid
  # @param [Hash] errors
  # @param [Hash] error_details
  # @param [String] method
  # OIDC Logout Submitted
  def oidc_logout_submitted(
    success: nil,
    client_id: nil,
    sp_initiated: nil,
    oidc: nil,
    client_id_parameter_present: nil,
    id_token_hint_parameter_present: nil,
    saml_request_valid: nil,
    errors: nil,
    error_details: nil,
    method: nil,
    **extra
  )
    track_event(
      'OIDC Logout Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      client_id: client_id,
      client_id_parameter_present: client_id_parameter_present,
      id_token_hint_parameter_present: id_token_hint_parameter_present,
      errors: errors,
      error_details: error_details,
      sp_initiated: sp_initiated,
      oidc: oidc,
      saml_request_valid: saml_request_valid,
      method: method,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [String] client_id
  # @param [Boolean] client_id_parameter_present
  # @param [Boolean] id_token_hint_parameter_present
  # @param [Boolean] sp_initiated
  # @param [Boolean] oidc
  # @param [Boolean] saml_request_valid
  # @param [Hash] errors
  # @param [Hash] error_details
  # @param [String] method
  # OIDC Logout Visited
  def oidc_logout_visited(
    success: nil,
    client_id: nil,
    sp_initiated: nil,
    oidc: nil,
    client_id_parameter_present: nil,
    id_token_hint_parameter_present: nil,
    saml_request_valid: nil,
    errors: nil,
    error_details: nil,
    method: nil,
    **extra
  )
    track_event(
      'OIDC Logout Page Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      client_id: client_id,
      client_id_parameter_present: client_id_parameter_present,
      id_token_hint_parameter_present: id_token_hint_parameter_present,
      errors: errors,
      error_details: error_details,
      sp_initiated: sp_initiated,
      oidc: oidc,
      saml_request_valid: saml_request_valid,
      method: method,
      **extra,
    )
  end

  # Tracks when a sucessful openid authorization request is returned
  # @param [String] client_id
  # @param [String] code_digest hash of returned "code" param
  def openid_connect_authorization_handoff(
    client_id:,
    code_digest:,
    **extra
  )
    track_event(
      'OpenID Connect: authorization request handoff', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      client_id: client_id,
      code_digest: code_digest,
      **extra,
    )
  end

  # Tracks when an openid connect bearer token authentication request is made
  # @param [Boolean] success
  # @param [Integer] ial
  # @param [String] client_id Service Provider issuer
  # @param [Hash] errors
  def openid_connect_bearer_token(success:, ial:, client_id:, errors:, **extra)
    track_event(
      'OpenID Connect: bearer token authentication', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      ial: ial,
      client_id: client_id,
      errors: errors,
      **extra,
    )
  end

  # Tracks when openid authorization request is made
  # @param [String] client_id
  # @param [String] scope
  # @param [Array] acr_values
  # @param [Boolean] unauthorized_scope
  # @param [Boolean] user_fully_authenticated
  def openid_connect_request_authorization(
    client_id:,
    scope:,
    acr_values:,
    unauthorized_scope:,
    user_fully_authenticated:,
    **extra
  )
    track_event(
      'OpenID Connect: authorization request', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      client_id: client_id,
      scope: scope,
      acr_values: acr_values,
      unauthorized_scope: unauthorized_scope,
      user_fully_authenticated: user_fully_authenticated,
      **extra,
    )
  end

  # Tracks when an openid connect token request is made
  # @param [String] client_id
  # @param [String] user_id
  # @param [String] code_digest hash of "code" param
  # @param [Integer, nil] expires_in time to expiration of token
  # @param [Integer, nil] ial ial level of identity
  def openid_connect_token(client_id:, user_id:, code_digest:, expires_in:, ial:, **extra)
    track_event(
      'OpenID Connect: token', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      client_id: client_id,
      user_id: user_id,
      code_digest: code_digest,
      expires_in: expires_in,
      ial: ial,
      **extra,
    )
  end

  # Tracks when user makes an otp delivery selection
  # @param [String] otp_delivery_preference (sms or voice)
  # @param [Boolean] resend
  # @param [String] country_code
  # @param [String] area_code
  # @param ["authentication","reauthentication","confirmation"] context user session context
  # @param [Hash] pii_like_keypaths
  def otp_delivery_selection(
    otp_delivery_preference:,
    resend:,
    country_code:,
    area_code:,
    context:,
    pii_like_keypaths:,
    **extra
  )
    track_event(
      'OTP: Delivery Selection', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      otp_delivery_preference: otp_delivery_preference,
      resend: resend,
      country_code: country_code,
      area_code: area_code,
      context: context,
      pii_like_keypaths: pii_like_keypaths,
      **extra,
    )
  end

  # Tracks if otp phone validation failed
  # @identity.idp.previous_event_name Twilio Phone Validation Failed
  # @param [String] error
  # @param [String] context
  # @param [String] country
  def otp_phone_validation_failed(error:, context:, country:, **extra)
    track_event(
      'Vendor Phone Validation failed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      error: error,
      context: context,
      country: country,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # The user updated their password
  def password_changed(success:, errors:, **extra)
    track_event('Password Changed', success: success, errors: errors, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # The user added a password after verifying their email for account creation
  def password_creation(success:, errors:, **extra)
    track_event('Password Creation', success: success, errors: errors, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # The user got their password incorrect the max number of times, their session was terminated
  def password_max_attempts
    track_event('Password Max Attempts Reached') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean, nil] confirmed if the account the reset is being requested for has a
  # confirmed email
  # @param [Boolean, nil] active_profile if the account the reset is being requested for has an
  # active proofed profile
  # The user entered an email address to request a password reset
  def password_reset_email(success:, errors:, confirmed:, active_profile:, **extra)
    track_event(
      'Password Reset: Email Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      confirmed: confirmed,
      active_profile: active_profile,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Boolean] profile_deactivated if the active profile for the account was deactivated
  # (the user will need to use their personal key to reactivate their profile)
  # The user changed the password for their account via the password reset flow
  def password_reset_password(success:, errors:, profile_deactivated:, **extra)
    track_event(
      'Password Reset: Password Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      profile_deactivated: profile_deactivated,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] user_id UUID of the user to receive password token
  # A password token has been sent for user
  def password_reset_token(success:, errors:, user_id:, **extra)
    track_event(
      'Password Reset: Token Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      user_id: user_id,
      **extra,
    )
  end

  # Password reset form has been visited.
  def password_reset_visit
    track_event('Password Reset: Email Form Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Pending account reset cancelled
  def pending_account_reset_cancelled
    track_event('Pending account reset cancelled') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Pending account reset visited
  def pending_account_reset_visited
    track_event('Pending account reset visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # Alert user if a personal key was used to sign in
  def personal_key_alert_about_sign_in(success:, errors:, **extra)
    track_event(
      'Personal key: Alert user about sign in', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      **extra,
    )
  end

  # Account reactivated with personal key
  def personal_key_reactivation
    track_event('Personal key reactivation: Account reactivated with personal key') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Account reactivated with personal key as MFA
  def personal_key_reactivation_sign_in
    track_event(
      'Personal key reactivation: Account reactivated with personal key as MFA', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Hash] pii_like_keypaths
  # Personal key form submitted
  def personal_key_reactivation_submitted(success:, errors:, pii_like_keypaths:, **extra)
    track_event(
      'Personal key reactivation: Personal key form submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      pii_like_keypaths: pii_like_keypaths,
      **extra,
    )
  end

  # Personal key reactivation visited
  def personal_key_reactivation_visited
    track_event('Personal key reactivation: Personal key form visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] personal_key_present if personal key is present
  # Personal key viewed
  def personal_key_viewed(personal_key_present:, **extra)
    track_event(
      'Personal key viewed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      personal_key_present: personal_key_present,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] delivery_preference
  # @param [Integer] phone_configuration_id
  # @param [Boolean] make_default_number
  # User has submitted a change in phone number
  def phone_change_submitted(
    success:,
    errors:,
    delivery_preference:,
    phone_configuration_id:,
    make_default_number:,
    **extra
  )
    track_event(
      'Phone Number Change: Form submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      delivery_preference: delivery_preference,
      phone_configuration_id: phone_configuration_id,
      make_default_number: make_default_number,
      **extra,
    )
  end

  # User has viewed the page to change their phone number
  def phone_change_viewed
    track_event('Phone Number Change: Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Integer] phone_configuration_id
  # tracks a phone number deletion event
  def phone_deletion(success:, phone_configuration_id:, **extra)
    track_event(
      'Phone Number Deletion: Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      phone_configuration_id: phone_configuration_id,
      **extra,
    )
  end

  # @identity.idp.previous_event_name User Registration: piv cac disabled
  # @identity.idp.previous_event_name PIV CAC disabled
  # Tracks when user's piv cac is disabled
  def piv_cac_disabled
    track_event(:piv_cac_disabled)
  end

  # @identity.idp.previous_event_name PIV/CAC login
  # @param [Boolean] success
  # @param [Hash] errors
  # tracks piv cac login event
  def piv_cac_login(success:, errors:, **extra)
    track_event(
      :piv_cac_login,
      success: success,
      errors: errors,
      **extra,
    )
  end

  def piv_cac_login_visited
    track_event(:piv_cac_login_visited)
  end

  # @identity.idp.previous_event_name User Registration: piv cac setup visited
  # @identity.idp.previous_event_name PIV CAC setup visited
  # Tracks when user's piv cac setup
  # @param [Boolean] in_account_creation_flow
  def piv_cac_setup_visited(in_account_creation_flow:, **extra)
    track_event(
      :piv_cac_setup_visited,
      in_account_creation_flow:,
      **extra,
    )
  end

  # @param [String] redirect_url URL user was directed to
  # @param [String, nil] step which step
  # @param [String, nil] location which part of a step, if applicable
  # @param ["idv", String, nil] flow which flow
  # User was redirected to the login.gov policy page
  def policy_redirect(redirect_url:, step: nil, location: nil, flow: nil, **extra)
    track_event(
      'Policy Page Redirect', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      redirect_url: redirect_url,
      step: step,
      location: location,
      flow: flow,
      **extra,
    )
  end

  # @param [String] error
  # Tracks if a Profile encryption is invalid
  def profile_encryption_invalid(error:, **extra)
    track_event('Profile Encryption: Invalid', error: error, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @see #profile_personal_key_create_notifications
  # User has chosen to receive a new personal key
  def profile_personal_key_create
    track_event('Profile: Created new personal key') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [true] success this event always succeeds
  # @param [Integer] emails number of email addresses the notification was sent to
  # @param [Array<String>] sms_message_ids AWS Pinpoint SMS message IDs for each phone number that
  # was notified
  # User has chosen to receive a new personal key, contains stats about notifications that
  # were sent to phone numbers and email addresses for the user
  def profile_personal_key_create_notifications(success:, emails:, sms_message_ids:, **extra)
    track_event(
      'Profile: Created new personal key notifications', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      emails: emails,
      sms_message_ids: sms_message_ids,
      **extra,
    )
  end

  # User has visited the page that lets them confirm if they want a new personal key
  def profile_personal_key_visit
    track_event('Profile: Visited new personal key') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name Proofing Address Timeout
  # The job for address verification (PhoneFinder) did not record a result in the expected
  # place during the expected time frame
  def proofing_address_result_missing
    track_event('Proofing Address Result Missing') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @identity.idp.previous_event_name Proofing Document Timeout
  # The job for document authentication did not record a result in the expected
  # place during the expected time frame
  def proofing_document_result_missing
    track_event('Proofing Document Result Missing') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks when a user triggered a rate limiter
  # @param [String] limiter_type
  # @identity.idp.previous_event_name Throttler Rate Limit Triggered
  def rate_limit_reached(limiter_type:, **extra)
    track_event(
      'Rate Limit Reached', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      limiter_type: limiter_type,
      **extra,
    )
  end

  # Rate limit triggered
  # @param [String] type
  def rate_limit_triggered(type:, **extra)
    track_event('Rate Limit Triggered', type: type, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Account profile reactivation submitted
  def reactivate_account_submit
    track_event('Reactivate Account Submitted') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Account profile reactivation page visited
  def reactivate_account_visit
    track_event('Reactivate Account Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # The result of a reCAPTCHA verification request was received
  # @param [Hash] recaptcha_result Full reCAPTCHA response body
  # @param [Float] score_threshold Minimum value for considering passing result
  # @param [Boolean] evaluated_as_valid Whether result was considered valid
  # @param [String] validator_class Class name of validator
  # @param [String, nil] exception_class Class name of exception, if error occurred
  # @param [String, nil] phone_country_code Country code associated with reCAPTCHA phone result
  def recaptcha_verify_result_received(
    recaptcha_result:,
    score_threshold:,
    evaluated_as_valid:,
    validator_class:,
    exception_class:,
    phone_country_code: nil,
    **extra
  )
    track_event(
      'reCAPTCHA verify result received', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        recaptcha_result:,
        score_threshold:,
        evaluated_as_valid:,
        validator_class:,
        exception_class:,
        phone_country_code:,
        **extra,
      }.compact,
    )
  end

  # User authenticated by a remembered device
  # @param [DateTime] cookie_created_at time the remember device cookie was created
  # @param [Integer] cookie_age_seconds age of the cookie in seconds
  def remembered_device_used_for_authentication(
    cookie_created_at:,
    cookie_age_seconds:,
    **extra
  )
    track_event(
      'Remembered device used for authentication', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      cookie_created_at: cookie_created_at,
      cookie_age_seconds: cookie_age_seconds,
      **extra,
    )
  end

  # Service provider completed remote logout
  # @param [String] service_provider
  # @param [String] user_id
  def remote_logout_completed(
    service_provider:,
    user_id:,
    **extra
  )
    track_event(
      'Remote Logout completed', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      service_provider: service_provider,
      user_id: user_id,
      **extra,
    )
  end

  # Service provider initiated remote logout
  # @param [String] service_provider
  # @param [Boolean] saml_request_valid
  def remote_logout_initiated(
    service_provider:,
    saml_request_valid:,
    **extra
  )
    track_event(
      'Remote Logout initiated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      service_provider: service_provider,
      saml_request_valid: saml_request_valid,
      **extra,
    )
  end

  # @param [Boolean] success
  # Tracks request for resending confirmation for new emails to an account
  def resend_add_email_request(success:, **extra)
    track_event(
      'Resend Add Email Requested', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      **extra,
    )
  end

  # A response timed out
  # @param [String] backtrace
  # @param [String] exception_message
  # @param [String] exception_class
  def response_timed_out(
    backtrace:,
    exception_message:,
    exception_class:,
    **extra
  )
    track_event(
      'Response Timed Out', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      backtrace: backtrace,
      exception_message: exception_message,
      exception_class: exception_class,
      **extra,
    )
  end

  # User cancelled the process and returned to the sp
  # @param [String] redirect_url the url of the service provider
  # @param [String] flow
  # @param [String] step
  # @param [String] location
  def return_to_sp_cancelled(
    redirect_url:,
    step: nil,
    location: nil,
    flow: nil,
    **extra
  )
    track_event(
      'Return to SP: Cancelled', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      redirect_url: redirect_url,
      step: step,
      location: location,
      flow: flow,
      **extra,
    )
  end

  # Tracks when a user is redirected back to the service provider after failing to proof.
  # @param [String] redirect_url the url of the service provider
  # @param [String] flow
  # @param [String] step
  # @param [String] location
  def return_to_sp_failure_to_proof(redirect_url:, flow: nil, step: nil, location: nil, **extra)
    track_event(
      'Return to SP: Failed to proof', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      redirect_url: redirect_url,
      flow: flow,
      step: step,
      location: location,
      **extra,
    )
  end

  # Tracks when rules of use is submitted with a success or failure
  # @param [Boolean] success
  # @param [Hash] errors
  def rules_of_use_submitted(success: nil, errors: nil, **extra)
    track_event(
      'Rules of Use Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      **extra,
    )
  end

  # Tracks when rules of use is visited
  def rules_of_use_visit
    track_event('Rules of Use Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Record SAML authentication payload Hash
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [String] nameid_format
  # @param [Array] authn_context
  # @param [String] authn_context_comparison
  # @param [String] service_provider
  def saml_auth(
    success:,
    errors:,
    nameid_format:,
    authn_context:,
    authn_context_comparison:,
    service_provider:,
    **extra
  )
    track_event(
      'SAML Auth', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      nameid_format: nameid_format,
      authn_context: authn_context,
      authn_context_comparison: authn_context_comparison,
      service_provider: service_provider,
      **extra,
    )
  end

  # @param [Integer] requested_ial
  # @param [String,nil] requested_aal_authn_context
  # @param [Boolean,nil] force_authn
  # @param [String] service_provider
  # An external request for SAML Authentication was received
  def saml_auth_request(
    requested_ial:,
    requested_aal_authn_context:,
    force_authn:,
    service_provider:,
    **extra
  )
    track_event(
      'SAML Auth Request', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        requested_ial: requested_ial,
        requested_aal_authn_context: requested_aal_authn_context,
        force_authn: force_authn,
        service_provider: service_provider,
        **extra,
      }.compact,
    )
  end

  # User dismissed the second MFA reminder page
  # @param [Boolean] opted_to_add Whether the user chose to add a method
  def second_mfa_reminder_dismissed(opted_to_add:, **extra)
    track_event('Second MFA Reminder Dismissed', opted_to_add:, **extra) # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # User visited the second MFA reminder page
  def second_mfa_reminder_visit
    track_event('Second MFA Reminder Visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks when security event is received
  # @param [Boolean] success
  # @param [String] error_code
  # @param [Hash] errors
  # @param [String] jti
  # @param [String] user_id
  # @param [String] client_id
  def security_event_received(
    success:,
    error_code: nil,
    errors: nil,
    jti: nil,
    user_id: nil,
    client_id: nil,
    **extra
  )
    track_event(
      'RISC: Security event received', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      error_code: error_code,
      errors: errors,
      jti: jti,
      user_id: user_id,
      client_id: client_id,
      **extra,
    )
  end

  # tracks if the session is kept alive
  def session_kept_alive
    track_event('Session Kept Alive') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # tracks if the session timed out
  def session_timed_out
    track_event('Session Timed Out') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # tracks when a user's session is timed out
  def session_total_duration_timeout
    track_event('User Maximum Session Length Exceeded') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] flash
  # @param [String] stored_location
  # tracks when a user visits the sign in page
  def sign_in_page_visit(flash:, stored_location:, **extra)
    track_event(
      'Sign in page visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      flash: flash,
      stored_location: stored_location,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Boolean] new_user
  # @param [Boolean] has_other_auth_methods
  # @param [Integer] phone_configuration_id
  # tracks when a user opts into SMS
  def sms_opt_in_submitted(
    success:,
    new_user:,
    has_other_auth_methods:,
    phone_configuration_id:,
    **extra
  )
    track_event(
      'SMS Opt-In: Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      new_user: new_user,
      has_other_auth_methods: has_other_auth_methods,
      phone_configuration_id: phone_configuration_id,
      **extra,
    )
  end

  # @param [Boolean] new_user
  # @param [Boolean] has_other_auth_methods
  # @param [Integer] phone_configuration_id
  # tracks when a user visits the sms opt in page
  def sms_opt_in_visit(
    new_user:,
    has_other_auth_methods:,
    phone_configuration_id:,
    **extra
  )
    track_event(
      'SMS Opt-In: Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      new_user: new_user,
      has_other_auth_methods: has_other_auth_methods,
      phone_configuration_id: phone_configuration_id,
      **extra,
    )
  end

  # Tracks when a user is bounced back from the service provider due to an integration issue.
  def sp_handoff_bounced_detected
    track_event('SP handoff bounced detected') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks when a user visits the bounced page.
  def sp_handoff_bounced_visit
    track_event('SP handoff bounced visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks when a user visits the "This agency no longer uses Login.gov" page.
  def sp_inactive_visit
    track_event('SP inactive visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks when a user is redirected back to the service provider
  # @param [Integer] ial
  # @param [Integer] billed_ial
  def sp_redirect_initiated(ial:, billed_ial:, **extra)
    track_event(
      'SP redirect initiated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      ial: ial,
      billed_ial: billed_ial,
      **extra,
    )
  end

  # Tracks when service provider consent is revoked
  # @param [String] issuer issuer of the service provider consent to be revoked
  def sp_revoke_consent_revoked(issuer:, **extra)
    track_event(
      'SP Revoke Consent: Revoked', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      issuer: issuer,
      **extra,
    )
  end

  # Tracks when the page to revoke consent (unlink from) a service provider visited
  # @param [String] issuer which issuer
  def sp_revoke_consent_visited(issuer:, **extra)
    track_event(
      'SP Revoke Consent: Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      issuer: issuer,
      **extra,
    )
  end

  # @param [String] area_code
  # @param [String] country_code
  # @param [String] phone_fingerprint the hmac fingerprint of the phone number formatted as e164
  # @param [String] context the context of the OTP, either "authentication" for confirmed phones
  # or "confirmation" for unconfirmed
  # @param ["sms","voice"] otp_delivery_preference the channel used to send the message
  # @param [Boolean] resend
  # @param [Hash] telephony_response
  # @param [:test, :pinpoint] adapter which adapter the OTP was delivered with
  # @param [Boolean] success
  # A phone one-time password send was attempted
  def telephony_otp_sent(
    area_code:,
    country_code:,
    phone_fingerprint:,
    context:,
    otp_delivery_preference:,
    resend:,
    telephony_response:,
    adapter:,
    success:,
    **extra
  )
    track_event(
      'Telephony: OTP sent', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        area_code: area_code,
        country_code: country_code,
        phone_fingerprint: phone_fingerprint,
        context: context,
        otp_delivery_preference: otp_delivery_preference,
        resend: resend,
        telephony_response: telephony_response,
        adapter: adapter,
        success: success,
        **extra,
      },
    )
  end

  # Tracks when a user visits TOTP device setup
  # @param [Boolean] user_signed_up
  # @param [Boolean] totp_secret_present
  # @param [Integer] enabled_mfa_methods_count
  # @param [Boolean] in_account_creation_flow
  def totp_setup_visit(
    user_signed_up:,
    totp_secret_present:,
    enabled_mfa_methods_count:,
    in_account_creation_flow:,
    **extra
  )
    track_event(
      'TOTP Setup Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      user_signed_up:,
      totp_secret_present:,
      enabled_mfa_methods_count:,
      in_account_creation_flow:,
      **extra,
    )
  end

  # Tracks when a user disabled a TOTP device
  def totp_user_disabled
    track_event('TOTP: User Disabled') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] controller
  # @param [String] referer
  # @param [Boolean] user_signed_in
  # Redirect was almost sent to an invalid external host unexpectedly
  def unsafe_redirect_error(
    controller:,
    referer:,
    user_signed_in: nil,
    **extra
  )
    track_event(
      'Unsafe Redirect', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      controller: controller,
      referer: referer,
      user_signed_in: user_signed_in,
      **extra,
    )
  end

  # User has attempted to access an action that requires re-authenticating
  # @param [String] auth_method
  # @param [String] authenticated_at
  def user_2fa_reauthentication_required(auth_method:, authenticated_at:, **extra)
    track_event(
      'User 2FA Reauthentication Required', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      auth_method: auth_method,
      authenticated_at: authenticated_at,
      **extra,
    )
  end

  # User has been marked as authenticated
  # @param [String] authentication_type
  def user_marked_authed(authentication_type:, **extra)
    track_event(
      'User marked authenticated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      authentication_type: authentication_type,
      **extra,
    )
  end

  # User was shown an "Are you sure you want to navigate away from this page?" message from their
  # browser (via onbeforeunload). (This is a frontend event.)
  # @param [String] path Path where this event was encountered.
  def user_prompted_before_navigation(path:, **extra)
    track_event(
      'User prompted before navigation', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      path: path,
      **extra,
    )
  end

  # User was shown an "Are you sure you want to navigate away from this page?" prompt via
  # onbeforeunload and was still on the page <seconds> later. (This is a frontend event.)
  # @param [String] path Path where this event was encountered.
  # @param [Integer] seconds Amount of time user has been on page since prompt.
  def user_prompted_before_navigation_and_still_on_page(path:, seconds:, **extra)
    track_event(
      'User prompted before navigation and still on page', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      path: path,
      seconds: seconds,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Integer] enabled_mfa_methods_count
  # @param [Integer] selected_mfa_count
  # @param ['voice', 'auth_app'] selection
  # Tracks when the the user has selected and submitted MFA auth methods on user registration
  def user_registration_2fa_setup(
    success:,
    errors: nil,
    selected_mfa_count: nil,
    enabled_mfa_methods_count: nil,
    selection: nil,
    **extra
  )
    track_event(
      'User Registration: 2FA Setup', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        success: success,
        errors: errors,
        selected_mfa_count: selected_mfa_count,
        enabled_mfa_methods_count: enabled_mfa_methods_count,
        selection: selection,
        **extra,
      }.compact,
    )
  end

  # Tracks when user visits MFA selection page
  # @param [Integer] enabled_mfa_methods_count Number of MFAs associated with user at time of visit
  def user_registration_2fa_setup_visit(enabled_mfa_methods_count:, **extra)
    track_event(
      'User Registration: 2FA Setup visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enabled_mfa_methods_count:,
      **extra,
    )
  end

  # User registration has been handed off to agency page
  # @param [Boolean] ial2
  # @param [Integer] ialmax
  # @param [String] service_provider_name
  # @param [String] page_occurence
  # @param [String] needs_completion_screen_reason
  # @param [Array] sp_request_requested_attributes
  # @param [Array] sp_session_requested_attributes
  def user_registration_agency_handoff_page_visit(
      ial2:,
      service_provider_name:,
      page_occurence:,
      needs_completion_screen_reason:,
      sp_session_requested_attributes:,
      sp_request_requested_attributes: nil,
      ialmax: nil,
      **extra
    )
    track_event(
      'User registration: agency handoff visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      ial2: ial2,
      ialmax: ialmax,
      service_provider_name: service_provider_name,
      page_occurence: page_occurence,
      needs_completion_screen_reason: needs_completion_screen_reason,
      sp_request_requested_attributes: sp_request_requested_attributes,
      sp_session_requested_attributes: sp_session_requested_attributes,
      **extra,
    )
  end

  # Tracks when user cancels registration
  # @param [String] request_came_from the controller/action the request came from
  def user_registration_cancellation(request_came_from:, **extra)
    track_event(
      'User registration: cancellation visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      request_came_from: request_came_from,
      **extra,
    )
  end

  # Tracks when user completes registration
  # @param [Boolean] ial2
  # @param [Boolean] ialmax
  # @param [String] service_provider_name
  # @param [String] page_occurence
  # @param [String] needs_completion_screen_reason
  # @param [Array] sp_request_requested_attributes
  # @param [Array] sp_session_requested_attributes
  def user_registration_complete(
    ial2:,
    service_provider_name:,
    page_occurence:,
    needs_completion_screen_reason:,
    sp_session_requested_attributes:,
    sp_request_requested_attributes: nil,
    ialmax: nil,
    **extra
  )
    track_event(
      'User registration: complete', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      ial2: ial2,
      ialmax: ialmax,
      service_provider_name: service_provider_name,
      page_occurence: page_occurence,
      needs_completion_screen_reason: needs_completion_screen_reason,
      sp_request_requested_attributes: sp_request_requested_attributes,
      sp_session_requested_attributes: sp_session_requested_attributes,
      **extra,
    )
  end

  # Tracks when user submits registration email
  # @param [Boolean] success
  # @param [Boolean] rate_limited
  # @param [Hash] errors
  # @param [Hash] error_details
  # @param [String] user_id
  # @param [String] domain_name
  def user_registration_email(
    success:,
    rate_limited:,
    errors:,
    error_details: nil,
    user_id: nil,
    domain_name: nil,
    **extra
  )
    track_event(
      'User Registration: Email Submitted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        success: success,
        rate_limited: rate_limited,
        errors: errors,
        error_details: error_details,
        user_id: user_id,
        domain_name: domain_name,
        **extra,
      }.compact,
    )
  end

  # Tracks when user confirms registration email
  # @param [Boolean] success
  # @param [Hash] errors
  # @param [Hash] error_details
  # @param [String] user_id
  def user_registration_email_confirmation(
    success:,
    errors:,
    error_details: nil,
    user_id: nil,
    **extra
  )
    track_event(
      'User Registration: Email Confirmation', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      errors: errors,
      error_details: error_details,
      user_id: user_id,
      **extra,
    )
  end

  # Tracks when user visits enter email page
  def user_registration_enter_email_visit
    track_event('User Registration: enter email visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [Boolean] success
  # @param [Hash] mfa_method_counts
  # @param [Integer] enabled_mfa_methods_count
  # @param [Boolean] second_mfa_reminder_conversion Whether it is a result of second MFA reminder.
  # @param [Hash] pii_like_keypaths
  # Tracks when a user has completed MFA setup
  def user_registration_mfa_setup_complete(
    success:,
    mfa_method_counts:,
    enabled_mfa_methods_count:,
    pii_like_keypaths:,
    second_mfa_reminder_conversion: nil,
    **extra
  )
    track_event(
      'User Registration: MFA Setup Complete', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        success: success,
        mfa_method_counts: mfa_method_counts,
        enabled_mfa_methods_count: enabled_mfa_methods_count,
        pii_like_keypaths: pii_like_keypaths,
        second_mfa_reminder_conversion:,
        **extra,
      }.compact,
    )
  end

  # @param [Integer] enabled_mfa_methods_count
  # Tracks when user visits the phone setup step during registration
  def user_registration_phone_setup_visit(enabled_mfa_methods_count:, **extra)
    track_event(
      'User Registration: phone setup visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enabled_mfa_methods_count: enabled_mfa_methods_count,
      **extra,
    )
  end

  # Tracks when user skips Suggest Another MFA Page
  def user_registration_suggest_another_mfa_notice_skipped
    track_event('User Registration: Suggest Another MFA Notice Skipped') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # Tracks when user visits Suggest Another MFA Page
  def user_registration_suggest_another_mfa_notice_visited
    track_event('User Registration: Suggest Another MFA Notice visited') # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
  end

  # @param [String] mfa_method
  # Tracks when the the user fully registered by submitting their first MFA method into the system
  def user_registration_user_fully_registered(
    mfa_method:,
    **extra
  )
    track_event(
      'User Registration: User Fully Registered', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        mfa_method: mfa_method,
        **extra,
      }.compact,
    )
  end

  # Tracks when user reinstated
  # @param [Boolean] success
  # @param [String] error_message
  def user_reinstated(
    success:,
    error_message: nil,
    **extra
  )
    track_event(
      'User Suspension: Reinstated', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        success: success,
        error_message: error_message,
        **extra,
      }.compact,
    )
  end

  # Tracks when user suspended
  # @param [Boolean] success
  # @param [String] error_message
  def user_suspended(
    success:,
    error_message: nil,
    **extra
  )
    track_event(
      'User Suspension: Suspended', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      {
        success: success,
        error_message: error_message,
        **extra,
      }.compact,
    )
  end

  # Tracks when the user is suspended and attempts to sign in, triggering the please call page.
  def user_suspended_please_call_visited(**extra)
    track_event(
      'User Suspension: Please call visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      **extra,
    )
  end

  # Tracks when USPS in-person proofing enrollment is created
  # @param [String] enrollment_code
  # @param [Integer] enrollment_id
  # @param [Boolean] second_address_line_present
  # @param [String] service_provider
  def usps_ippaas_enrollment_created(
    enrollment_code:,
    enrollment_id:,
    second_address_line_present:,
    service_provider:,
    **extra
  )
    track_event(
      'USPS IPPaaS enrollment created', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      enrollment_code: enrollment_code,
      enrollment_id: enrollment_id,
      second_address_line_present: second_address_line_present,
      service_provider: service_provider,
      **extra,
    )
  end

  # @param [Hash] vendor_status
  # @param [String,nil] redirect_from
  # Tracks when vendor has outage
  def vendor_outage(
    vendor_status:,
    redirect_from: nil,
    **extra
  )
    track_event(
      'Vendor Outage', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      redirect_from: redirect_from,
      vendor_status: vendor_status,
      **extra,
    )
  end

  # @param [Boolean] success
  # @param [Integer] mfa_method_counts
  # Tracks when WebAuthn is deleted
  def webauthn_deleted(success:, mfa_method_counts:, pii_like_keypaths:, **extra)
    track_event(
      'WebAuthn Deleted', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      success: success,
      mfa_method_counts: mfa_method_counts,
      pii_like_keypaths: pii_like_keypaths,
      **extra,
    )
  end

  # @param [Hash] platform_authenticator
  # @param [Hash] errors
  # @param [Integer] enabled_mfa_methods_count
  # @param [Boolean] success
  # Tracks when WebAuthn setup is visited
  def webauthn_setup_visit(platform_authenticator:, errors:, enabled_mfa_methods_count:, success:,
                           **extra)
    track_event(
      'WebAuthn Setup Visited', # rubocop:disable IdentityIdp/AnalyticsEventNameLinter # rubocop:disable IdentityIdp/AnalyticsEventNameLinter
      platform_authenticator: platform_authenticator,
      errors: errors,
      enabled_mfa_methods_count: enabled_mfa_methods_count,
      success: success,
      **extra,
    )
  end
end
