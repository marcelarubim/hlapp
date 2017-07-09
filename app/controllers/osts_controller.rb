# .nodoc. #
class OstsController < ApplicationController
  before_action :setup_installation
  before_action :setup_ost, only: [:edit, :update, :destroy]

  def index
    @osts = @installation.osts
  end

  def new
    @ost = @installation.osts.new
  end

  def create
    @ost = Ost.create(ost_params)
    if @ost.save
      redirect_to @ost
      flash[:success] = 'OST successfully created'
    else
      render :new
      flash[:danger] = 'OST not created'
    end
  end

  def edit; end

  def update
    if @ost.update(ost_params)
      redirect_to ost_path(@ost)
      flash[:success] = 'OST successfully updated'
    else
      render :edit
      flash.now[:danger] = 'OST not updated'
    end
  end

  private

  def setup_installation
    @installation = Installation.find(params[:installation_id])
  end

  def setup_ost
    @ost = Ost.find(params[:id])
  end

  def ost_params
    params.require(:ost)
          .permit(:status, :type, :program_date, :service_execution_date, :qc_date,
                  :service_method, :complain, :defects, :repair_status, :equip_replaced,
                  :installed_qty, :collected_qty, :product_evaluation, :installation_id,
                  :executor_id, :attendant_id, flow_attributes: flow_attributes)
  end

  def flow_attributes
    [:notes, :ost_id, :id, :_destroy]
  end
end
