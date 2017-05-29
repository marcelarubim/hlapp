# .nodoc. #
class Contract < ApplicationRecord
  has_paper_trail
  default_scope { order(date: :desc) }
  belongs_to :client
  has_many :services, dependent: :destroy
  has_many :productions, through: :services
  has_many :installations, through: :services
  has_many :ops, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def display
    "Category: #{category.display}\tDate: #{date}\tStatus: #{status}"
  end
end
