# .nodoc. #
class OstFlow < ApplicationRecord
  has_paper_trail
  belongs_to :ost
end
