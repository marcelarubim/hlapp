# .nodoc. #
class Address < ApplicationRecord
  has_paper_trail
  default_scope { order(address: :asc) }
  belongs_to :addressable, polymorphic: true

  def complete_address
    if complement
      "#{address}, #{num}, #{complement}, #{city}/#{state}"
    else
      "#{address}, #{num}, #{city}/#{state}"
    end
  end
end
