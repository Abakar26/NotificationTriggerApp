class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true
  validates :password, presence: true, length: { minimum: 8 }

  after_create :send_notification

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def send_notification
    # Logic to send notification using SMS API
    SmsNotificationJob.perform_later(id)
  end

  public :send_notification unless Rails.env.production?
end
