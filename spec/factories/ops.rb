FactoryGirl.define do
  factory :op do
    contract
    solicitant { contract.client.contacts.sample }
    narrator { Faker::Name.first_name + ' ' + Faker::Name.last_name }
    language { Faker::Color.color_name }
    track { Faker::Color.color_name + ' ' + Faker::Name.last_name }
    kind { Op.kinds.keys.sample }
    process_phase { Op.process_phases.keys.sample }
    status { Op.statuses.keys.sample }
    priority { Op.priorities.keys.sample }
    briefing_date { Faker::Date.between(10.days.ago, Date.today) }
    max_delivery_date { briefing_date + 20 }
    text_delivery_date { briefing_date + rand(2..5) }
    text_approving_date { text_delivery_date + rand(2..5) }
    recording_date { text_approving_date + rand(2..5) }
    demo_delivery_date { recording_date + rand(2..5) }
    demo_approving_date { demo_delivery_date + rand(2..5) }
    studio_release_date { demo_approving_date + rand(2..5) }
    studio_executor { User.all.sample }
    comun_executor { User.all.sample }
    editor { User.all.sample }
    text_approver { User.all.sample }
    # association :creator, factory: :user, strategy: :build
  end
end
