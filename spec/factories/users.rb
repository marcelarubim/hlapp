FactoryGirl.define do
  factory :user do
    password { Faker::Internet.password(6) }
    password_confirmation { password.to_s }
  end
end
