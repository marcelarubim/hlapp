# .nodoc. #
class Service < ApplicationRecord
  has_paper_trail
  belongs_to :contract
  belongs_to :spv, class_name: 'ServiceProductVariation',
                   foreign_key: 'service_product_variation_id'
  has_many :productions, dependent: :destroy
  has_many :installations, dependent: :destroy

  def resume
    spv.display
  end
end
