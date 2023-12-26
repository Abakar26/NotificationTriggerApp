class SmsNotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    # Logic to send SMS using Twilio or another SMS API
    TwilioService.send_sms(user.phone_number, "Welcome, #{user.full_name}! Thanks for Signing Up!")
  end
end
