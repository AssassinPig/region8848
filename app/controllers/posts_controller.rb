class PostsController < ApplicationController
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
  end

  def show
    @post = Post.find(params[:id])
    if @post.nil? 
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if !@post.nil? 
      @post.destroy
    end

      redirect_to root_path
  end
end
