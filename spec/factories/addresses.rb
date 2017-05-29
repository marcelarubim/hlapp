FactoryGirl.define do
  factory :address do
    association :addressable, factory: :client, strategy: :build
    address { Faker::Address.street_name + Faker::Address.street_suffix }
    num { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    district { Faker::Address.street_name }
    city { Faker::Address.city }
    zip_code { Faker::Address.zip_code }
    state { Faker::Address.state }
    country { Faker::Address.country }
  end
end
