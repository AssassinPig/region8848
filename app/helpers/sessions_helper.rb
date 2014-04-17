module SessionsHelper
  def sign_in(user)
    @current_user = user
    cookies.permanent[:token] = @current_user.token 
  end

  def sign_in?
    @current_user.nil? && cookies.permanent[:token]
  end

  def login?
    sign_in?
  end

  def sign_out
    @current_user = nil
    cookies.delete(:token)
  end

  def current_user
    @current_user ||= User.find_by_token(cookies.permanent[:token])
  end

  def login?
    !current_user.nil?
  end
end
