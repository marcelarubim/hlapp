FactoryGirl.define do
  factory :installation do
    service
    association :responsible, factory: :contact
  end
end
