module Idv
  module PhoneQuestionAbTestConcern
    def phone_question_ab_test_bucket
      AbTests::IDV_PHONE_QUESTION.bucket(phone_question_user.uuid)
    end

    def phone_question_user
      if defined?(document_capture_user) # hybrid flow
        document_capture_user
      else
        current_user
      end
    end

    def maybe_redirect_for_phone_question_ab_test
      return if phone_question_ab_test_bucket != :show_phone_question

      return if !defined?(idv_session)
      return if !idv_session.phone_with_camera.nil?

      redirect_to idv_phone_question_url
    end

    def phone_question_ab_test_analytics_bucket
      {
        phone_question_ab_test_bucket:
          phone_question_ab_test_bucket,
      }
    end
  end
end
