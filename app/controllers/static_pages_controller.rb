class StaticPagesController < ApplicationController
  before_filter :fetch_all_category
  before_filter :fetch_all_posts, :only=>[:home, :posts]

  def home
  end

  def posts
    @posts=@posts.paginate(:page=>params[:page])
  end

  def about_me
  end

  def admin
    if params[:password][:password] == "654321"
      flash.now[:success] = "welcome!!!" 
    else 
      flash.now[:error] = "you can't do this"
      redirect_to(static_pages_home_path)
    end
  end

  def thanks
  end

  private
    def fetch_all_posts
      @posts = Post.all
    end

end
