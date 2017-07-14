FactoryGirl.define do
  factory :production do
    service
    theme { Faker::Commerce.color }
    details { Faker::Lorem.paragraph }
    airing_month { Faker::Date.between(Date.today, 240.days.from_now) }
    renew_forecast_month { (airing_month + rand(100...400)).strftime('%Y-%m') }

    after(:create) do |production|
      production.airing_month = production.airing_month.to_date.strftime('%Y-%m')
      production.save
    end
  end
end
