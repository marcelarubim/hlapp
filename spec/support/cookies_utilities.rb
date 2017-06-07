def reset_session
  session = Capybara.current_session.driver
  remember_token_value = session.request.cookies['remember_token']
  user_id_value = session.request.cookies['user_id']
  Capybara.reset_sessions!
  cookies = { 'remember_token': remember_token_value, 'user_id': user_id_value }
  define_cookies(cookies)
end

def define_cookies(cookies)
  cookies.each do |key, value|
    page.driver.browser.set_cookie("#{key}=#{value}")
  end
end

def remember_user
  Capybara.current_session.driver.request.cookies['remember_token']
end
