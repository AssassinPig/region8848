class Admin::PostsController < Admin::ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    post = Post.create!(post_params)
    if post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  def show 
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end
