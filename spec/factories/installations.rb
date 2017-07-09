FactoryGirl.define do
  factory :installation do
    service
    association :responsible, factory: :contact
    sequence(:code) { |n| contract.client.business_name.downcase.split.join + n.to_s }
    language { Faker::Address.country_code }
    install_phone { Faker::PhoneNumber.cell_phone.gsub(/[\-\(\) .]/, '') }
    status { Installation.statuses.keys.sample }
    equipment { service.spv }
  end
end
