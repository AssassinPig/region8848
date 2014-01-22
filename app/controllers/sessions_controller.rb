class SessionsController < ApplicationController
  def new
    Rails.logger.debug("session new aciton")
    Rails.logger.debug(params)
    flash[:success] = "success new session"
    redirect_to root_path
  end

  def create 
    Rails.logger.debug("session create aciton")
    Rails.logger.debug(params);

    user = User.find_by_nick(params[:user][:username]) 

    if user.password != Digest::SHA256.hexdigest(params[:user][:password]+user.password_digest)
      flash[:error] = "invalid username or password"
      redirect_to root_path
      return 
    end

    flash[:success] = "success create session"
    sign_in user 

    #session[:remember_token] = 

    redirect_to root_path
  end

  def destroy
    Rails.logger.debug("session destroy aciton")
    sign_out
    redirect_to root_path
  end
end
