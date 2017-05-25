FactoryGirl.define do
  factory :address do
    association :addressable, factory: :client, strategy: :build
  end
end
