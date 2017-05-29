# .nodoc. #
class OpFlow < ApplicationRecord
  has_paper_trail
  belongs_to :op
end
