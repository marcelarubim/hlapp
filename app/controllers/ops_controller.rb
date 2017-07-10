# .nodoc. #
class OpsController < ApplicationController
  before_action :logged_in_user
  before_action :setup_contract, only: [:index, :new, :create]
  before_action :setup_op, only: [:edit, :update, :destroy]

  def index
    @ops = @contract.ops
  end

  def new
    @op = @contract.ops.new
  end

  def create
    @op = Op.create(op_params)
    if @op.save
      redirect_to @op
      flash[:success] = 'OP successfully created'
    else
      render :new
      flash[:danger] = 'OP not created'
    end
  end

  def edit; end

  def update
    update_productions
    if @op.update(op_params)
      redirect_to op_path(@op)
      flash[:success] = 'OP successfully updated'
    else
      render :edit
      flash[:danger] = 'OP not updated'
    end
  end

  private

  def setup_contract
    @contract = Contract.find(params[:contract_id])
  end

  def setup_op
    @op = Op.find(params[:id])
  end

  def op_params
    params.require(:op).permit(:narrator, :language, :track, :kind, :process_phase,
                               :status, :priority, :briefing_date, :max_delivery_date,
                               :text_delivery_date, :text_approving_date, :recording_date,
                               :demo_delivery_date, :demo_approving_date,
                               :studio_release_date, :contract_id, :solicitant_id,
                               :text_approver_id, :comun_executor_id, :studio_executor_id,
                               :editor_id, :production_ids,
                               fluxes_attributes: fluxes_attributes)
  end

  def update_productions
    @op.productions << Production.where(id: params[:op][:production_ids])
    to_delete = @op.productions.where.not(id: params[:op][:production_ids])
    @op.productions.delete(to_delete)
  end

  def fluxes_attributes
    [:notes, :fluxable, :id, :_destroy]
  end
end
