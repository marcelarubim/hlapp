FactoryGirl.define do
  factory :ost do
    installation
    association :executor, factory: :user, strategy: :build
    association :attendant, factory: :user, strategy: :build
  end
end
