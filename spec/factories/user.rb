FactoryBot.define do
  factory :user do
    # Use sequence to make sure that the value is unique
    sequence(:first_name) { |n| "first-#{n}" }
    sequence(:last_name) { |n| "last-#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
  end
end
