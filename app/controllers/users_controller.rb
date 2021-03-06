# .nodoc. #
class UsersController < ApplicationController
  before_action :setup_user
  before_action :logged_in_user
  before_action :correct_user

  def show; end

  def edit; end

  def update
    ans, type, msg = authentication
    flash.now[type] = msg
    render ans ? :show : :edit
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def setup_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to logged_in? ? user_url(current_user) : login_path
  end

  def correct_user
    redirect_to user_url(current_user) unless current_user?(@user)
  end

  def authentication
    result = password_authentication(params[:current_password], params[:user][:password],
                                     params[:user][:password_confirmation])
    result
  end

  def password_authentication(current_pass, new_pass, pass_confirmation)
    return false, :danger, 'The current password is incorrect' unless
      User.find(current_user.id).try(:authenticate, current_pass).present?
    return false, :danger, 'New password has to be different from the current password' if
      current_pass == new_pass
    return false, :danger, 'Password confirmation doesnt match new password' if
      new_pass != pass_confirmation
    return false, :danger, 'New password is invalid (min 6 characteres)' unless
      @user.update_attributes(user_params)
    return true, :danger, 'Password not updated' if new_pass.blank? &&
                                                    pass_confirmation.blank?
    log_in @user
    [true, :success, 'Password updated with success!']
  end
end
