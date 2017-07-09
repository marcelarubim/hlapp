FactoryGirl.define do
  factory :production do
    service
    theme { Faker::Commerce.color }
    details { Faker::Lorem.paragraph }
    airing_month { Faker::Date.between(Date.today, 240.days.from_now) }
    renew_forecast_month { airing_month + rand(100...400) }
  end
end
