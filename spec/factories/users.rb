FactoryBot.define do

  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password { "abc123" }
    password_confirmation { "abc123" }
    age { 22 }
  end
end