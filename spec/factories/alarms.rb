FactoryBot.define do

  factory :alarm do
    task { "運動" }
    association :user
  end
end