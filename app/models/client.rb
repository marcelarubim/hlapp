# .nodoc. #
class Client < ApplicationRecord
  has_many :contracts

  validates_presence_of :business_name, :legal_name, :cnpj
end
