class TwilioService
  def self.send_sms(to, body)
    client = Twilio::REST::Client.new
    client.messages.create(
      from: Rails.application.credentials.twilio[:phone_number],
      to:,
      body:
    )
  end
end
