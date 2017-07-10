# .nodoc. #
class Flux < ApplicationRecord
  has_paper_trail
  belongs_to :fluxable, polymorphic: true

  def display
    [created_at.strftime('%d/%m/%Y'), notes.truncate(56)].join(' - ')
  end
end
