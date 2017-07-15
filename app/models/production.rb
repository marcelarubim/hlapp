# .nodoc. #
class Production < ApplicationRecord
  has_paper_trail
  belongs_to :service
  has_one :contract, through: :service
  belongs_to :op, optional: true
  scope :with_op, -> { where.not(op_id: nil) }
  scope :without_op, -> { where(op_id: nil) }
  scope :available, ->(op_id) { where(op_id: [nil, op_id]) }

  def display
    "#{theme} - #{airing_month}"
  end
end
