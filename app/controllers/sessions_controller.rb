class SessionsController < ApplicationController
  def new
    flash[:success] = "success new session"
    redirect_to root_path
  end

  def create 
    user = User.find_by_nick(params[:user][:username]) 

    if user.password != Digest::SHA256.hexdigest(params[:user][:password]+user.password_digest)
      flash[:error] = "invalid username or password"
      redirect_to root_path
      return 
    end

    flash[:success] = "success create session"
    sign_in user 

    redirect_to root_path
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
