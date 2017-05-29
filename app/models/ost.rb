# .nodoc. #
class Ost < ApplicationRecord
  has_paper_trail
  belongs_to :installation
  has_many :ost_flows, dependent: :destroy
  belongs_to :executor, class_name: 'User'
  belongs_to :attendant, class_name: 'User'
end
