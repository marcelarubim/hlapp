FactoryGirl.define do
  factory :user do
    fullname { Faker::Name.first_name + ' ' + Faker::Name.last_name }
    cpf { Faker::Number.unique.number(11) }
    email { Faker::Internet.email(fullname) }
    password { Faker::Internet.password(6) }
    password_confirmation { password.to_s }
  end
end
