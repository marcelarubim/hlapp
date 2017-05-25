FactoryGirl.define do
  factory :client_category do
    name { Faker::Commerce.department(1) }
    sector { Faker::Commerce.color }
  end
end
