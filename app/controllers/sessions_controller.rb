class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by_name(params[:username])
    if user && user.authenticate(params[:password])
      sign_in user 
      flash[:success] = "success create session"
      redirect_to forum_path 
    else  
      flash.now[:error] = "invalid username or password"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to forum_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
