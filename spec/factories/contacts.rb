FactoryGirl.define do
  factory :contact do
    fullname { Faker::Name.first_name + ' ' + Faker::Name.last_name }
    position { Faker::Company.profession }
    telephone { Faker::PhoneNumber.cell_phone.gsub(/[\-\(\) .]/, '') }
    mobile { Faker::PhoneNumber.cell_phone.gsub(/[\-\(\) .]/, '') }
    email { Faker::Internet.email(fullname) }
    birthday { Faker::Date.between(70.years.ago, 18.years.ago) }
    responsible_for { Faker::Commerce.department }
    # association :creator, factory: :user, strategy: :build
    client
  end
end
