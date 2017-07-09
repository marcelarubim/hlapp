FactoryGirl.define do
  factory :service do
    before(:create) do |service|
      service.spv = if ServiceProductVariation.count.zero?
                      create(:service_product_variation)
                    else
                      ServiceProductVariation.find(ServiceProductVariation
                                                   .pluck(:id).sample)
                    end
    end
    contract
  end
end
