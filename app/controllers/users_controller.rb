class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #salt = Array.new(10){ rand(1024).to_s(36) }.join
    #pass = Digest::SHA256.hexdigest(password+salt)
    @user = User.new(user_params)
    if @user.save 
      sign_in @user 
      redirect_to forum_path
    else
      flash.now[:error] = "user create failed"
      render :new
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
