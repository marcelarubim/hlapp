FactoryGirl.define do
  factory :service do
    contract
    association :spv, factory: :service_product_variation
  end
end
