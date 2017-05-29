# .nodoc. #
class Installation < ApplicationRecord
  has_paper_trail
  belongs_to :service
  has_one :contract, through: :service
  has_one :address, as: :addressable, dependent: :destroy
  has_many :osts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :responsible, class_name: 'Contact'
end
