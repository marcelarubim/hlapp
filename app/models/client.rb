# .nodoc. #
class Client < ApplicationRecord
  has_many :contracts, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  belongs_to :category, class_name: 'ClientCategory'
  belongs_to :seller, class_name: 'User'
  belongs_to :captured_by, class_name: 'User'
  belongs_to :telemarketing, class_name: 'User'

  # validates_presence_of :business_name, :legal_name, :cnpj
end
