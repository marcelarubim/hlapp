# .nodoc. #
class ClientsController < ApplicationController
  before_action :logged_in_user
  before_action :setup_client, only: [:edit, :update, :destroy]

  def index
    @clients = Client.search(params[:query])
    flash.now[:info] = 'Any client found' if @clients&.empty? ||
                                             @clients.nil? && params[:query]&.empty?
    @clients = Client.all if @clients.blank? # admin? &&
    # @clients = Client.all
  end

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

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client)
      flash[:success] = 'Client successfully updated'
    else
      render :edit
      flash[:danger] = 'Client not updated'
    end
  end

  def destroy
    if @client.destroy
      redirect_to clients_path
      flash[:success] = 'Client successfully destroyed'
    else
      flash[:danger] = 'Client not destroyed'
    end
  end

  private

  def client_params
    params.require(:client).permit(:business_name, :legal_name, :cnpj, :telephone, :fax,
                                   :website, :month_anniversary, :welcome_letter,
                                   :referrer, :seller_id, :captured_by_id, :category_id,
                                   :seller_id, :captured_by_id, :telemarketing_id,
                                   :category_id,
                                   contracts_attributes: [:id, :_destroy],
                                   addresses_attributes: addr_attributes,
                                   contacts_attributes: contacts_attributes,
                                   category_attributes: category_attributes)
  end

  def addr_attributes
    [:address, :num, :complement, :district, :city, :state, :zip_code,
     :country, :addressable, :id, :_destroy]
  end

  def contacts_attributes
    [:fullname, :position, :telephone, :mobile, :email, :birthday,
     :responsible_for, :id, :_destroy]
  end

  def category_attributes
    [:sector, :name]
  end

  def setup_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to clients_path
    flash[:danger] = 'Client not found'
  end
end
