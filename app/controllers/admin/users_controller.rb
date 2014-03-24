class Admin::UsersController < ApplicationController
  def login 
  #  @user=User.new

  #  if params[:password][:password] == "654321"
  #    flash.now[:success] = "welcome!!!" 
  #    redirect_to(admin_home_path)
  #  else 
  #    flash.now[:error] = "you can't do this"
  #    redirect_to(static_pages_home_path)
  #  end
  end

  def home
    @user=User.new
  end

  def create
  end
end
