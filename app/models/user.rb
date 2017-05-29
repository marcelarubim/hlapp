# .nodoc. #
class User < ApplicationRecord
  has_paper_trail
  has_secure_password
  has_many :addresses, as: :addressable, dependent: :destroy
end
