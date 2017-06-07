# .nodoc. #
class Contact < ApplicationRecord
  has_paper_trail
  default_scope { order(fullname: :asc) }
  belongs_to :client

  def display
    fullname.to_s
  end
end
