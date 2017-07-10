# .nodoc. #
class SessionsController < ApplicationController
  def new
    redirect_back_or current_user if logged_in?
  end

  def create
    user, valid, msg = validate_user
    if valid
      redirect_back_or user
    else
      flash.now[:danger] = msg
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def get_error_message(is_valid, incorrect_user)
    if is_valid
      nil
    elsif incorrect_user
      'User/password pair is incorrect'
    else
      'User inactive'
    end
  end

  def log_in_user(user)
    log_in user
    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  end

  def validate_user
    user = User.find_by(cpf: params[:session][:cpf])
    authenticated = user&.authenticate(params[:session][:password])
    is_valid = authenticated && user.status
    message = get_error_message(is_valid, !user || !authenticated)
    log_in_user user if is_valid
    [user, is_valid, message]
  end
end
