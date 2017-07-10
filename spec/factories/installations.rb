FactoryGirl.define do
  factory :installation do
    service
    responsible { contract.client.contacts.sample }
    code { contract.client.business_name.downcase.split.join + Time.now.to_i.to_s }
    language { Faker::Address.country_code }
    install_phone { Faker::PhoneNumber.cell_phone.gsub(/[\-\(\) .]/, '') }
    status { Installation.statuses.keys.sample }
    gr_qc { Faker::Lorem.sentence }
    equipment { service.spv }
    guarantee_limit { Faker::Date.between(Date.today, 5.years.from_now) }

    trait :with_address do
      after(:create) do |installation|
        create :address, addressable: installation
      end
    end
  end
end
