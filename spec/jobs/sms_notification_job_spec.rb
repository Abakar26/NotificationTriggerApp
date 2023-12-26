require 'rails_helper'

RSpec.describe SmsNotificationJob, type: :job do
  include ActiveJob::TestHelper

  describe '#perform' do
    let(:user) { create(:user) }

    it 'sends an SMS to the user' do
      allow(TwilioService).to receive(:send_sms)

      expect do
        SmsNotificationJob.perform_now(user.id)
      end.to have_enqueued_job(SmsNotificationJob)

      expect(TwilioService).to have_received(:send_sms).with(user.phone_number,
                                                             "Welcome, #{user.full_name}! Thanks for Signing Up!")
    end
  end
end
