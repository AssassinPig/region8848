class UsersController < ApplicationController
  def new
  end

  def create
    flash.now[:success] = "user controller create"
    
    username = params[:user][:username] 
    email = params[:user][:email] 
    password = params[:user][:password] 
    salt = Array.new(10){ rand(1024).to_s(36) }.join
    pass = Digest::SHA256.hexdigest(password+salt)
    @user = User.create(:nick=> username, :email=>email, :password=>pass, :password_digest=>salt)
    redirect_to users_path
  end

  def show 
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
