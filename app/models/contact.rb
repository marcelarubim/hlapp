# .nodoc. #
class Contact < ApplicationRecord
  has_paper_trail
  default_scope { order(fullname: :asc) }
  belongs_to :client
end
