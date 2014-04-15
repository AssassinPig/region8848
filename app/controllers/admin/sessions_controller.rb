class Admin::SessionsController < Admin::ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.find_by_name(params[:username])
    if user && user.authenticate(params[:password])
      sign_in user 
      redirect_to admin_root_path 
    else  
      render :new
    end
  end

  def destroy
    sign_out 
    redirect_to admin_root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
