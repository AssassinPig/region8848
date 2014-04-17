class UsersController < ApplicationController
  def new
  end

  def create
    username = params[:user][:username] 
    email = params[:user][:email] 
    password = params[:user][:password] 
    password_confirmation = params[:user][:password_confirmation] 
    #salt = Array.new(10){ rand(1024).to_s(36) }.join
    #pass = Digest::SHA256.hexdigest(password+salt)
    user = User.create(:name=> username, :email=>email, :password=>password, :password_confirmation=>password_confirmation)
    if !user.nil?
      sign_in user 
    else
      flash.now[:success] = "user controller create"
    end
    redirect_to forum_path
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
  
end
