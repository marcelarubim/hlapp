FactoryGirl.define do
  factory :service_product_variation do
    association :service_type, name: Faker::HL.service
    association :product_type, name: Faker::HL.product
    association :variation_type, name: Faker::HL.variation
  end
end
