class StaticPagesController < ApplicationController
  def home
      @posts = Post.all
      Rails.logger.debug("home action") 
      Rails.logger.debug(params);
  end

  def notes
      @posts = Post.all
      Rails.logger.debug("get posts") 
      Rails.logger.debug(@posts) 
  end

  def posts
      @posts = Post.all
      Rails.logger.debug("get posts") 
      Rails.logger.debug(@posts) 
  end

  def about_me
  end

  def admin
      if params[:password][:password] == "654321"
        @posts = Post.all
        Rails.logger.debug("ok admin") 
        flash.now[:success] = "welcome!!!" 
      else 
        flash.now[:error] = "you can't do this"
        redirect_to(static_pages_home_path)
      end
  end
end
