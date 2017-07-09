FactoryGirl.define do
  factory :product_type do
    name { Faker::HL.product }
  end
end
