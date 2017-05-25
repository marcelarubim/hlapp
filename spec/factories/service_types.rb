FactoryGirl.define do
  factory :service_type do
    name { Faker::Food.unique.ingredient }
  end
end
