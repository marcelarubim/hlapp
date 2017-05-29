# .nodoc. #
class Client < ApplicationRecord
  has_paper_trail
  has_many :contracts, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  belongs_to :category, class_name: 'ClientCategory'
  belongs_to :seller, class_name: 'User'
  belongs_to :captured_by, class_name: 'User'
  belongs_to :telemarketing, class_name: 'User'

  accepts_nested_attributes_for :addresses, :contacts, :contracts,
                                allow_destroy: true, reject_if: :all_blank

  # validates_presence_of :business_name, :legal_name, :cnpj
end
