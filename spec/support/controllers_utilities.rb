def log_in(user_id)
  controller.session[:user_id] = user_id
end

def current_user
  if (user_id = session[:user_id])
    @current_user ||= User.find_by(id: user_id)
  elsif (user_id = cookies.signed[:user_id])
    user = User.find_by(id: user_id)
    if user && user.authenticated?(cookies[:remember_token])
      log_in user
      @current_user = user
    end
  end
end

def routing(request, action, **params)
  case request
  when :get
    get action, params: params
  when :post
    post action, params: params
  when :patch
    patch action, params: params
  when :delete
    delete action, params: params
  end
end
