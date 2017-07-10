FactoryGirl.define do
  factory :flux do
    association :fluxable, factory: :ost, strategy: :build
    notes { Faker::Lorem.paragraph }
  end
end
