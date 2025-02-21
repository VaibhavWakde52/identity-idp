require 'ab_test_bucket'

module AbTests
  DOC_AUTH_VENDOR = AbTestBucket.new(
    experiment_name: 'Doc Auth Vendor',
    buckets: {
      alternate_vendor: IdentityConfig.store.doc_auth_vendor_randomize ?
        IdentityConfig.store.doc_auth_vendor_randomize_percent :
        0,
    }.compact,
  )

  ACUANT_SDK = AbTestBucket.new(
    experiment_name: 'Acuant SDK Upgrade',
    buckets: {
      use_alternate_sdk: IdentityConfig.store.idv_acuant_sdk_upgrade_a_b_testing_enabled ?
        IdentityConfig.store.idv_acuant_sdk_upgrade_a_b_testing_percent :
        0,
    },
  )

  IDV_GETTING_STARTED = AbTestBucket.new(
    experiment_name: 'Idv: Getting Started Experience',
    buckets: IdentityConfig.store.idv_getting_started_a_b_testing,
  )

  IDV_PHONE_QUESTION = AbTestBucket.new(
    experiment_name: 'Idv: Phone Question',
    buckets: IdentityConfig.store.idv_phone_question_a_b_testing,
  )
end
