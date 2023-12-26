FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { 'john.doe@example.com' }
    phone_number { '1234567890' }
    password { 'password123' }
  end
end
