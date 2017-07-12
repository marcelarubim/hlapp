# .nodoc. #
class Service < ApplicationRecord
  has_paper_trail
  belongs_to :contract
  belongs_to :spv, class_name: 'ServiceProductVariation',
                   foreign_key: 'service_product_variation_id'
  has_many :productions, dependent: :destroy
  has_many :installations, dependent: :destroy

  COURTESY_OPT = [:normal, :courtesy, :extra].freeze
  enum courtesy: COURTESY_OPT

  accepts_nested_attributes_for :productions, allow_destroy: true, reject_if: :all_blank

  def display
    spv.display
  end

  def service_type
    spv&.service_type_id
  end

  def product_type
    spv&.product_type_id
  end

  def product_variation
    spv&.product_type&.name.to_s + spv&.variation_type&.name.to_s
  end
end
