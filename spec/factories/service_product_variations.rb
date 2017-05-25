FactoryGirl.define do
  factory :service_product_variation do
    association :service_type
    association :product_type
    association :variation_type
  end
end
