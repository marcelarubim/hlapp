FactoryGirl.define do
  factory :client do
    association :category, factory: :client_category
    seller { User.find(User.pluck(:id).sample) }
    captured_by { User.find(User.pluck(:id).sample) }
    telemarketing { User.find(User.pluck(:id).sample) }
    business_name { Faker::Company.name }
    legal_name { Faker::Company.name + Faker::Company.suffix }
    cnpj { Faker::Number.unique.number(14) }
    telephone { Faker::PhoneNumber.cell_phone }
    fax { Faker::PhoneNumber.cell_phone }
    website { Faker::Internet.url }
    month_anniversary { Faker::Date.between(30.years.ago, Date.today).strftime('%Y-%m') }
    welcome_letter { Faker::Date.between(2.years.ago, Date.today) }
    referrer { Faker::Name.first_name }

    trait :with_associated do
      after(:create) do |client|
        create_list :contact, 3, client: client
        create_list :address, 1, addressable: client
        create_list :contract, 2, client: client
      end
    end
  end
end
