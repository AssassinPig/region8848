module SessionsHelper
  def sign_in(user)
    @current_user = user
    cookies.permanent[:remember_token] = @current_user.remember_token 
    Rails.logger.debug("sign user")
  end

  def sign_in?
    @current_user.nil? && cookies.permanent[:remember_token]
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
    Rails.logger.debug("sign_out")
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies.permanent[:remember_token])
  end
end
