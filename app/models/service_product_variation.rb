# .nodoc. #
class ServiceProductVariation < ApplicationRecord
  belongs_to :service_type
  belongs_to :product_type
  belongs_to :variation_type

  def display
    "#{service_type.titleize} - #{product_type.titleize} - #{variation_type.titleize}"
  end
end
