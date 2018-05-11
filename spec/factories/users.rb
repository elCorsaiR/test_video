FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@example.org" }
    password '123456'
  end
end