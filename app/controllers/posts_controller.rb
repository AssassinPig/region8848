class PostsController < ApplicationController
  before_filter :fetch_all_category

  def new
  end

  def create
    category = Category.find(params[:new_post][:category_value])
    post = Post.create(:title=>params[:new_post][:title],
                      :content=>params[:new_post][:content],
                      :category_id=>category.id
                      )
  
    if post.nil?
      flash[:error] = "invalid username or password"
      redirect_to root_path
    end
    
    flash[:success] = "create post success"
    redirect_to root_path  
  end

  def index
      @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @post.increase_view_times
    @categories = Category.all
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
    def fetch_all_category
      @categories = Category.all
    end

end
