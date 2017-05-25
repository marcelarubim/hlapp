# .nodoc. #
class ServiceProductVariation < ApplicationRecord
  belongs_to :service_type
  belongs_to :product_type
  belongs_to :variation_type
end
