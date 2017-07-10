# .nodoc. #
class ApplicationController < ActionController::Base
  include ApplicationHelper
  include SessionsHelper
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

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = 'Please log in'
    redirect_to login_url
  end

  def admin?
    current_user.role == 'admin'
  end

  def expire_hsts
    response.headers['Strict-Transport-Security'] = 'max-age=0'
  end

  def production?
    current_user.role == 'production'
  end

  def technic?
    current_user.role == 'technic'
  end

  def seller?
    current_user.role == 'seller'
  end

  def admin
    return if admin?
    flash[:warning] = 'Access denied'
    redirect_to user_url(current_user)
  end

  def admin_or_production
    return if admin? || production?
    flash[:warning] = 'Access denied'
    redirect_to user_url(current_user)
  end

  def admin_or_production_or_seller
    return if admin? || production? || seller?
    redirect_to user_url(current_user)
    flash[:warning] = 'Access denied'
  end

  def not_new_user
    return unless current_user.role == 'new_user'
    flash[:warning] = 'Access denied'
    redirect_to user_url(current_user)
  end
end
