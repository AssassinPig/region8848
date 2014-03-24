class StaticPagesController < ApplicationController
  before_filter :fetch_all_category
  before_filter :fetch_all_posts, :only=>[:home, :posts, :admin]

  def home
  end

  def posts
    @posts=@posts.paginate(:page=>params[:page])
  end

  def about_me
  end

  def thanks
  end

  private
    def fetch_all_posts
      @posts = Post.all
    end

end
