class StaticPagesController < ApplicationController
  before_filter :fetch_all_category

  def home
    @posts = Post.all
    @categories = Category.all
  end

  def posts
    @posts = Post.all
    @categories = Category.all
  end

  def about_me
  end

  def admin
    if params[:password][:password] == "654321"
      @posts = Post.all
      flash.now[:success] = "welcome!!!" 
    else 
      flash.now[:error] = "you can't do this"
      redirect_to(static_pages_home_path)
    end
  end

  def thanks
  end

  private
  def fetch_all_category
    @categories = Category.all
  end
end
