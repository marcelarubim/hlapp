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

  STATUS_OPT = [:ativo, :eventual, :desistente, :pendente, :inadimplente, :renegociacao,
                :cancelamento, :cancelado].freeze
  CATEGORIES_OPT = [:locacao, :temporario, :venda, :parceria, :permuta, :manutencao]
                   .freeze
  ARCH_STATUS_OPT = [:archieved, :only_client, :copy].freeze
  NARRATOR_OPT = [:not_defined, :default, :special].freeze

  enum status: STATUS_OPT
  enum category: CATEGORIES_OPT
  enum archiving_status: ARCH_STATUS_OPT
  enum narrator_type: NARRATOR_OPT

  def display
    "Category: #{category.display}\tDate: #{date}\tStatus: #{status}"
  end
end
