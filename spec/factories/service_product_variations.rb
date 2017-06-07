FactoryGirl.define do
  factory :service_product_variation do
    association :service_type, name: Faker::Food.unique.ingredient
    association :product_type, name: Faker::Food.ingredient
    association :variation_type, name: Faker::Food.ingredient
  end
end
