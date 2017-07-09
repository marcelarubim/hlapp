# .nodoc. #
class Ost < ApplicationRecord
  has_paper_trail
  belongs_to :installation
  has_many :ost_flows, dependent: :destroy
  belongs_to :executor, class_name: 'User'
  belongs_to :attendant, class_name: 'User'

  accepts_nested_attributes_for :fluxes, allow_destroy: true, reject_if: :all_blank

  enum status: []
  enum type: []
  enum service_method: []
  enum repair_status: []
end
