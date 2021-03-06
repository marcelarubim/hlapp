# .nodoc. #
class FilterController < ApplicationController
  before_action :logged_in_user
  def client_categories
    selection = ClientCategory.where(sector: params[:sector])
                              .select(:id, :name).order(:name)
    render json: selection
  end

  def service_products
    sel = ProductType.where(id: ServiceProductVariation
                       .product_types(params[:service_type]))
    render json: sel
  end

  def service_variations
    sel = ServiceProductVariation.where(service_type_id: params[:service_type],
                                        product_type_id: params[:product_type])
    sel = sel.map do |x|
      if x.variation_type_id.nil?
        { id: x.id, name: '' }
      else
        { id: x.id, name: VariationType.find(x.variation_type_id).name }
      end
    end
    render json: sel
  end

  def productions_available
    sel = Op.find(params[:op]).contract.productions.select(:id, :theme).order(:theme)
    # sel = Op.find(params[:op]).contract.productions.select(:id, :theme)
    render json: sel
  end
end
