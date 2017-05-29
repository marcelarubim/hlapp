# .nodoc. #
class ClientCategory < ApplicationRecord
  has_paper_trail
  has_many :clients, inverse_of: 'category'

  def display
    "#{name.titleize} - #{sector.titleize}"
  end
end
