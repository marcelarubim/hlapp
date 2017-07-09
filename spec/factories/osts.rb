FactoryGirl.define do
  factory :ost do
    installation
    status { Ost.statuses.keys.sample }
    type { Ost.types.keys.sample }
    program_date { Faker::Date.forward(60) }
    service_execution_date { [nil, Faker::Date.forward(60)].sample }
    qc_date {}
    service_method { Ost.service_methods.keys.sample }
    complain {}
    defects {}
    repair_status { Ost.repair_statuses.keys.sample }
    equip_replaced { [0, 1].sample }
    installed_qty {}
    collected_qty {}
    product_evaluation {}
    association :executor, factory: :user, strategy: :build
    association :attendant, factory: :user, strategy: :build
  end
end
