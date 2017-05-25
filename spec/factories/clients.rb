FactoryGirl.define do
  factory :client do
    association :category, factory: :client_category
    association :seller, factory: :user
    association :captured_by, factory: :user
    association :telemarketing, factory: :user
    business_name { Faker::Company.name }
    legal_name { Faker::Company.name + Faker::Company.suffix }
    cnpj { Faker::Number.unique.number(14) }
    telephone { Faker::PhoneNumber.cell_phone }
    fax { Faker::PhoneNumber.cell_phone }
    website { Faker::Internet.url }
    month_anniversary { Faker::Number.between(1, 12) }
    welcome_letter { Date.today }
    referrer { Faker::Name.first_name }
    # association :creator, factory: :user, strategy: :build
    after(:create) do |client|
      create_list :contact, 3, client: client
    end
  end
end
