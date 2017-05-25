# .nodoc. #
class Contract < ApplicationRecord
  belongs_to :client
  has_many :services, dependent: :destroy
  has_many :productions, through: :services
  has_many :installations, through: :services
  has_many :ops, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
