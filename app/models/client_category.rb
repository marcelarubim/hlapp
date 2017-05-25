# .nodoc. #
class ClientCategory < ApplicationRecord
  has_many :clients, inverse_of: 'category'
end
