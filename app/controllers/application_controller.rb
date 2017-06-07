# .nodoc. #
class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  def destroy_object
    class_name = params[:class_name]
    if Object.const_get(class_name.classify).find(params[:id]).destroy
      flash.now[:success] = "#{class_name} successfully destroyed"
    else
      flash.now[:danger] = "#{class_name} not destroyed"
    end
    render 'destroy.js', layout: false
  end

  def add_object
    @child = params[:child].singularize
    @id = Time.now.to_i
    @parent = params[:path].remove("[#{params[:child]}_attributes]")
    @path = "#{params[:path]}[#{@id}]"
    render 'add_object', layout: false
  end
end
