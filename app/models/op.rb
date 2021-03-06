# .nodoc. #
class Op < ApplicationRecord
  has_paper_trail
  belongs_to :contract
  belongs_to :solicitant, class_name: 'Contact'
  belongs_to :text_approver, class_name: 'User'
  belongs_to :comun_executor, class_name: 'User'
  belongs_to :studio_executor, class_name: 'User'
  belongs_to :editor, class_name: 'User'
  has_many :productions
  has_many :fluxes, as: :fluxable, dependent: :destroy

  enum kind: [:implantacao, :anual, :adicional, :ponto_adicional, :antecipa_anual,
              :atualizacao, :migracao, :extra_contrato, :venda, :loc_temporaria,
              :cortesia_unica, :correcao, :mixagem, :piloto, :risco]
  enum process_phase: [:aguardando_briefing, :revisao_txt, :criacao_txt, :aprovacao_txt,
                       :confirmacao_finaceiro, :gravacao, :edicao, :aprovacao_producao,
                       :producao_liberar, :programacao, :montagem_equip,
                       :aguardando_correio, :controle_qualidade, :finalizado,
                       :desistencia, :sem_retorno, :nao_implantado]
  enum status: [:em_andamento, :finalizado, :sem_retorno], _prefix: true
  enum priority: [:normal, :urgente]

  accepts_nested_attributes_for :productions, reject_if: :all_blank
  accepts_nested_attributes_for :fluxes, allow_destroy: true, reject_if: :all_blank

end
