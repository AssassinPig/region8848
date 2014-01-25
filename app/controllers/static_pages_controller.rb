class StaticPagesController < ApplicationController
  def home
      @posts = Post.all
  end

  def notes
      @posts = Post.all
  end

  def posts
      @posts = Post.all
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

      @categories = Category.all
  end
end
