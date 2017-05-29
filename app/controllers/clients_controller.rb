# .nodoc. #
class ClientsController < ApplicationController
  before_action :setup_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all.order(:business_name)
  end

  def show; end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    if @client.save
      redirect_to @client
      flash[:success] = 'Client successfully created'
    else
      render :new
      flash[:danger] = 'Client not created'
    end
  end

  def edit
    @client.addresses.new
    @client.contacts.new
    @client.contracts.new
  end

  def update
    # category = Category.where(sector: params[:category_sector],
                              # name: params[:category_name]).take
    # @client.category = category
    if @client.update(client_params)
      redirect_to client_path(@client.id)
      flash[:success] = 'Client successfully updated'
    else
      render :show
      flash[:danger] = 'Client not updated'
    end
  end

  def destroy
    return unless @client.destroy
    redirect_to clients_path
    flash[:success] = 'Client successfully destroyed'
  end

  private

  def client_params
    params.require(:client).permit(:business_name, :legal_name, :cnpj, :telephone, :fax,
                                   :website, :month_anniversary, :welcome_letter,
                                   :referrer, :seller_id, :captured_by_id, :category_id,
                                   :seller_id, :captured_by_id, :telemarketing_id,
                                   :category_id,
                                   contracts_attributes: [:id, :_destroy],
                                   addresses_attributes: add_attributes,
                                   contacts_attributes: contacts_attributes)
  end

  def add_attributes
    [:address, :num, :complement, :district, :city, :state, :zip_code,
     :country, :id, :_destroy]
  end

  def contacts_attributes
    [:fullname, :position, :telephone, :mobile, :email, :birthday,
     :responsible_for, :id, :_destroy]
  end

  def setup_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to clients_path
    flash[:danger] = 'Client not found'
  end
end
