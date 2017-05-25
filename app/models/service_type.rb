# .nodoc. #
class ServiceType < ApplicationRecord
  has_many :service_product_variations
  has_many :product_types, -> { distinct }, through: :service_product_variations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
