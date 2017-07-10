# .nodoc. #
class ServiceProductVariation < ApplicationRecord
  belongs_to :service_type
  belongs_to :product_type
  belongs_to :variation_type, optional: true

  def display
    base = "#{service_type.name.titleize} - #{product_type.name.titleize}"
    base += " - #{variation_type.name.titleize}" unless variation_type.nil?
    base
  end

  def self.service_types
    ServiceType.where(id: ServiceProductVariation.all.select(:service_type_id))
  end

  def self.product_types(service)
    ProductType.where(id: ServiceProductVariation.where(service_type_id: service)
               .select(:product_type_id))
  end
end
