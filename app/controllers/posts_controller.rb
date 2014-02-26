class PostsController < ApplicationController
  before_filter :fetch_all_category 

  def new
  end

  def create
    category = Category.find(params[:new_post][:category_id])
    post = category.posts.build(post_params)

    if post.nil?
      flash.now[:error] = "invalid username or password"
      redirect_to root_path
    end

    post.save
    flash.now[:success] = "create post success"
    redirect_to root_path  
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
    @post.increase_view_times
    if @post.nil? 
      redirect_to root_path
    end
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def destroy
    @post = Post.find(params[:id])
    if !@post.nil? 
      @post.destroy
    end

    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
    if @post.nil? 
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.nil? 
      redirect_to root_path
    end

    @post.update_attributes params[:post].permit(:content)
    redirect_to post_path(@post)
  end

  private
  def post_params
    params.require(:new_post).permit(:title, :content, :category_id, :view_times)
  end

end
