# .nodoc. #
class Ost < ApplicationRecord
  has_paper_trail
  belongs_to :installation
  has_many :fluxes, as: :fluxable, dependent: :destroy
  belongs_to :executor, class_name: 'User'
  belongs_to :attendant, class_name: 'User'

  accepts_nested_attributes_for :fluxes, allow_destroy: true, reject_if: :all_blank

  enum status: [:in_progress, :complete, :no_return]
  enum type: [:implantacao, :loc_temporaria, :manutencao_troca_producao,
              :troca_equipamento, :edicao_holdcast, :migracao, :migracao_temporaria,
              :apoio_tecnico, :recolhimento, :cancelado]
  enum service_method: [:correio, :visita, :telefone, :web_servidor]
  enum repair_status: []
  enum product_evaluation: [:a_instalar, :espera_ok, :mudo, :musica_interna,
                            :ruido_chiado, :volume_alto, :volume_baixo, :desativado]
end
