require 'rails_helper'

describe 'Account history' do
  let(:user) { create(:user, :signed_up, created_at: Time.zone.now - 100.days) }
  let(:account_created_event) { create(:event, user: user, created_at: Time.zone.now - 98.days) }
  let(:usps_mail_sent_event) do
    create(:event, user: user, event_type: :usps_mail_sent, created_at: Time.zone.now - 90.days)
  end
  let(:identity_with_link) do
    create(
      :identity,
      :active,
      user: user,
      last_authenticated_at: Time.zone.now - 80.days,
      service_provider: 'http://localhost:3000'
    )
  end
  let(:usps_mail_sent_again_event) do
    create(:event, user: user, event_type: :usps_mail_sent, created_at: Time.zone.now - 60.days)
  end
  let(:identity_without_link) do
    create(
      :identity,
      :active,
      user: user,
      last_authenticated_at: Time.zone.now - 50.days,
      service_provider: 'https://rp2.serviceprovider.com/auth/saml/metadata'
    )
  end
  let(:account_created_timestamp) { account_created_event.decorate.happened_at_in_words }
  let(:usps_mail_sent_timestamp) { usps_mail_sent_event.decorate.happened_at_in_words }
  let(:identity_with_link_timestamp) { identity_with_link.decorate.happened_at_in_words }
  let(:usps_mail_sent_again_timestamp) { usps_mail_sent_again_event.decorate.happened_at_in_words }
  let(:identity_without_link_timestamp) { identity_without_link.decorate.happened_at_in_words }

  before do
    sign_in_and_2fa_user(user)
    build_account_history
    visit account_path
  end

  scenario 'viewing account history' do
    [account_created_event, usps_mail_sent_event, usps_mail_sent_again_event].each do |event|
      decorated_event = event.decorate
      expect(page).to have_content(decorated_event.event_type)
      expect(page).to have_content(decorated_event.happened_at_in_words)
    end

    expect(page).to have_content(
      t('event_types.authenticated_at', service_provider: identity_without_link.display_name)
    )
    expect(page).to_not have_link(identity_without_link.display_name)

    expect(page).to have_content(
      t('event_types.authenticated_at_html', service_provider_link: identity_with_link.display_name)
    )
    expect(page).to have_link(
      identity_with_link.display_name, href: 'http://localhost:3000'
    )

    expect(identity_without_link_timestamp).to appear_before(usps_mail_sent_again_timestamp)
    expect(usps_mail_sent_again_timestamp).to appear_before(identity_with_link_timestamp)
    expect(identity_with_link_timestamp).to appear_before(usps_mail_sent_timestamp)
    expect(usps_mail_sent_timestamp).to appear_before(account_created_timestamp)
  end

  def build_account_history
    account_created_event
    usps_mail_sent_event
    usps_mail_sent_again_event
    identity_with_link
    identity_without_link
  end
end
