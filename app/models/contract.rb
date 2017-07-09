# .nodoc. #
class Contract < ApplicationRecord
  has_paper_trail
  default_scope { order(date: :desc) }
  belongs_to :client
  has_many :services, dependent: :destroy
  has_many :productions, through: :services
  has_many :installations, through: :services
  has_many :ops, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  accepts_nested_attributes_for :services, allow_destroy: true, reject_if: :all_blank
                                # proc { |attributes| attributes['courtesy'].blank? }

  enum status: [:ativo, :eventual, :desistente, :pendente, :inadimplente, :renegociacao,
                :cancelamento, :cancelado]
  enum category: [:locacao, :temporario, :venda, :parceria, :permuta, :manutencao]
  enum archiving_status: [:archieved, :only_client, :copy]
  enum narrator_type: [:not_defined, :default, :special]

  def display
    "Category: #{category.display}\tDate: #{date}\tStatus: #{status}"
  end
end
