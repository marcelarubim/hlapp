FactoryGirl.define do
  factory :comment do
    association :commentable, factory: :contract, strategy: :build
  end
end
