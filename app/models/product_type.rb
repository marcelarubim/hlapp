# .nodoc. #
class ProductType < ApplicationRecord
  has_paper_trail
  has_many :service_product_variations
  has_many :variation_types, -> { distinct }, through: :service_product_variations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
