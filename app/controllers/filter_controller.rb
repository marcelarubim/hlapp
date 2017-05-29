# .nodoc. #
class FilterController < ApplicationController
  def client_categories
    selection = ClientCategory.where(sector: params[:sector])
                              .select(:id, :name).order(:name)
    render json: selection
  end
end
