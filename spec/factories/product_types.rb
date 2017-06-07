FactoryGirl.define do
  factory :product_type do
    name { Faker::Food.unique.ingredient }
  end
end
