class GpoReminderSender
  LOCAL_DATABASE_TIMEOUT = 60_000

  def send_emails(for_letters_sent_before)
    letter_eligible_range =
      IdentityConfig.store.usps_confirmation_max_days.days.ago..for_letters_sent_before

    profiles_due_for_reminder(letter_eligible_range).each do |profile|
      profile.user.send_email_to_all_addresses(:gpo_reminder)
      profile.gpo_confirmation_codes.all.each do |gpo_code|
        next if gpo_code.reminder_sent_at
        next unless letter_eligible_range.cover?(gpo_code.created_at)

        gpo_code.update(reminder_sent_at: Time.zone.now)
      end
      analytics.idv_gpo_reminder_email_sent(user_id: profile.user.uuid)
    end
  end

  private

  def profiles_due_for_reminder(letter_eligible_range)
    ActiveRecord::Base.transaction do
      ActiveRecord::Base.connection.execute(
        "SET LOCAL statement_timeout = #{LOCAL_DATABASE_TIMEOUT}",
      )

      Profile.joins(:gpo_confirmation_codes).
        where(
          gpo_verification_pending_at: letter_eligible_range,
          gpo_confirmation_codes: { reminder_sent_at: nil },
          deactivation_reason: [nil, :in_person_verification_pending],
        )
    end
  end

  def analytics
    Analytics.new(user: AnonymousUser.new, request: nil, session: {}, sp: nil)
  end
end
