FactoryGirl.define do
  factory :contract do
    client
    status { Contract.statuses.keys.sample }
    category { Contract.categories.keys.sample }
    archiving_status { Contract.archiving_statuses.keys.sample }
    narrator_type { Contract.narrator_types.keys.sample }
    pay_method { Faker::Food.ingredient }
    date { Faker::Date.between(70.months.ago, 1.day.ago) }
    renewal_date { Faker::Date.between(Date.today + 180, 1.year.from_now) }
    language { Faker::Color.color_name }
    audio_format { Faker::File.extension }
    tt_prod_contracted { rand(1..10) }
    tt_inst_contracted { rand(0..20) }
  end
end
