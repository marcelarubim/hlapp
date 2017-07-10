FactoryGirl.define do
  factory :ost do
    installation
    status { Ost.statuses.keys.sample }
    kind { Ost.kinds.keys.sample }
    program_date { Faker::Date.forward(60) }
    service_execution_date { [nil, Faker::Date.forward(60)].sample }
    qc_date {}
    service_method { Ost.service_methods.keys.sample }
    complain { Faker::Lorem.sentence }
    defects { Faker::Lorem.sentence }
    repair_status { Ost.repair_statuses.keys.sample }
    equip_replaced { [0, 1].sample }
    installed_qty { equip_replaced ? rand(0..5) : 0 }
    collected_qty { equip_replaced ? rand(0..5) : 0 }
    product_evaluation { Ost.product_evaluations.keys.sample }
    executor { User.find(User.pluck(:id).sample) }
    attendant { User.find(User.pluck(:id).sample) }

    trait :with_flux do
      after(:create) do |ost|
        create_list :flux, rand(0..5), fluxable: ost
      end
    end
  end
end
