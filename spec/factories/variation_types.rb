FactoryGirl.define do
  factory :variation_type do
    name { Faker::Food.unique.ingredient }
  end
end
