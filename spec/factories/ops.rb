FactoryGirl.define do
  factory :op do
    contract
    solicitant { contract.client.contacts.first }
    narrator { Faker::Name.first_name + ' ' + Faker::Name.last_name }
    language { Faker::Color.color_name }
    track { Faker::Color.color_name }
    kind { Faker::Number.between(0, 14) }
    process_phase { Faker::Number.between(0, 16) }
    status { Faker::Number.between(0, 2) }
    priority { Faker::Number.between(0, 1) }
    briefing_date { Faker::Date.between(10.days.ago, Date.today) }
    max_delivery_date { briefing_date + 20 }
    text_delivery_date { briefing_date + rand(2..5) }
    text_approving_date { text_delivery_date + rand(2..5) }
    recording_date { text_approving_date + rand(2..5) }
    demo_delivery_date { recording_date + rand(2..5) }
    demo_approving_date { demo_delivery_date + rand(2..5) }
    studio_release_date { demo_approving_date + rand(2..5) }
    association :text_approver, factory: :user, strategy: :build
    association :comun_executor, factory: :user, strategy: :build
    association :studio_executor, factory: :user, strategy: :build
    association :editor, factory: :user, strategy: :build
    # association :creator, factory: :user, strategy: :build
  end
end
