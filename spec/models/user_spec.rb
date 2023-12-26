# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'john.doe@example.com',
      phone_number: '1234567890',
      password: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a first name' do
    user = User.new(first_name: nil)
    expect(user).to_not be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'methods' do
    let(:user) { create(:user, first_name: 'John', last_name: 'Doe') }

    it 'returns the full name' do
      expect(user.full_name).to eq('John Doe')
    end
  end

  describe 'callbacks' do
    it 'triggers send_notification after create' do
      user = build(:user)
      expect(user).to receive(:send_notification)
      user.save
    end
  end

  describe '#send_notification' do
    let(:user) { create(:user) }

    it 'enqueues SmsNotificationJob' do
      expect(SmsNotificationJob).to receive(:perform_later).with(user.id)
      user.send_notification
    end
  end
end
