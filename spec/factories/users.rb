FactoryGirl.define do
  sequence :name do |n|
    "test user #{n}"
  end
  sequence :email do |n|
    "user_#{n}@example.com"
  end

  factory :user do
    name
    email
    password 'abc123'
    password_confirmation 'abc123'
  end
end