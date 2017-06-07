# .nodoc. #
class ContractsController < ApplicationController
  before_action :setup_contract, only: [:edit, :update, :destroy]

  def new
    @client = Client.find(params[:client_id])
    @contract = @client.contracts.new
  end

  def create
    @client = Client.find(params[:client_id])
    @contract = @client.contracts.new(contract_params)
    if @contract.save
      redirect_to contract_path(@contract)
      flash[:success] = 'Contract successfully created'
    else
      render :new
      flash[:danger] = 'Contract not created'
    end
  end

  def edit; end

  def update
    if @contract.update(contract_params)
      redirect_to contract_path
      flash[:success] = 'Contract successfully updated'
    else
      render :edit
      flash[:danger] = 'Contract not updated'
    end
  end

  def destroy
    if @contract.destroy
      flash.now[:success] = 'Contract successfully destroyed'
      render 'destroy.js'
    else
      flash[:danger] = 'Contract not destroyed'
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:date, :old_num, :status, :category, :pay_method,
                                     :archiving_status, :renewal_date, :language,
                                     :narrator_type, :audio_format, :tt_prod_contracted,
                                     :tt_inst_contracted,
                                     services_attributes: services_attributes)
  end

  def services_attributes
    [:courtesy, :service_product_variation_id, :id, :_destroy,
     productions_attributes: productions_attributes]
  end

  def productions_attributes
    [:theme, :details, :airing_month, :renew_forecast_month, :id, :_destroy]
  end

  def setup_contract
    @contract = Contract.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to contracts_path
    flash[:danger] = 'Contract not found'
  end
end
