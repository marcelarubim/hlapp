# .nodoc. #
class InstallationsController < ApplicationController
  before_action :setup_contract, only: [:index, :new, :create]
  before_action :setup_installation, only: [:edit, :update, :destroy]

  def index
    @installations = @contract.installations
  end

  def new
    @installation = @contract.installations.new
  end

  def create
    @installation = Installation.create(installation_params)
    if @installation.save
      redirect_to @installation
      flash[:success] = 'Installation successfully created'
    else
      render :new
      flash[:danger] = 'Installation not created'
    end
  end

  def edit; end

  def update
    if @installation.update(installation_params)
      redirect_to installation_path(@installation)
      flash[:success] = 'Installation successfully updated'
    else
      render :edit
      flash.now[:danger] = 'Installation not updated'
    end
  end

  private

  def setup_contract
    @contract = Contract.find(params[:contract_id])
  end

  def setup_installation
    @installation = Installation.find(params[:id])
  end

  def installation_params
    params.require(:installation)
          .permit(:code, :language, :install_phone, :gr_qc, :pabx, :status,
                  :guarantee_type, :delivery_date, :guarantee_limit, :service_id,
                  :responsible_id, address_attributes: addr_attributes)
  end

  def addr_attributes
    [:address, :num, :complement, :district, :city, :state, :zip_code,
     :country, :id, :_destroy]
  end
end
