# .nodoc. #
class Production < ApplicationRecord
  has_paper_trail
  belongs_to :service
  has_one :contract, through: :service
  belongs_to :op, optional: true
end
