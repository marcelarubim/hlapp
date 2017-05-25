# .nodoc. #
class Service < ApplicationRecord
  belongs_to :contract
  belongs_to :spv, class_name: 'ServiceProductVariation',
                   foreign_key: 'service_product_variation_id'
  has_many :productions, dependent: :destroy
  has_many :installations, dependent: :destroy
end
