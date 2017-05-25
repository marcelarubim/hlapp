FactoryGirl.define do
  factory :product_type do
    name { Faker::Name.unique }
  end
end
