# .nodoc. #
class Production < ApplicationRecord
  belongs_to :service
  has_one :contract, through: :service
  belongs_to :op, optional: true
end
