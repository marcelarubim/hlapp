# .nodoc. #
class FilterController < ApplicationController
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
    sel = sel.map { |x| { id: x.id, name: VariationType.find(x.variation_type_id).name } }
    render json: sel
  end

  def productions_available
    sel = Op.find(params[:op]).contract.productions.select(:id, :theme).order(:theme)
    # sel = Op.find(params[:op]).contract.productions.select(:id, :theme)
    render json: sel
  end
end
