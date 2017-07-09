FactoryGirl.define do
  factory :contract do
    client
    status { Contract.statuses.keys.sample }
    category { Contract.categories.keys.sample }
    archiving_status { Contract.archiving_statuses.keys.sample }
    narrator_type { Contract.narrator_types.keys.sample }
    pay_method { Faker::Food.ingredient }
    date { Date.today - rand(0..5) }
    renewal_date { Date.today + 1.year }
    language { Faker::Color.color_name }
    audio_format { Faker::File.extension }
    tt_prod_contracted { Faker::Number.between(1, 2) }
    tt_inst_contracted { Faker::Number.between(1, 2) }
  end
end
