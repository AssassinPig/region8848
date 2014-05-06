#encoding: UTF-8
class PostsController < ApplicationController
  before_filter :fetch_all_category 

  def new
    @post = current_user.posts.new
    @categories = Category.all
  end

  def create
    post = current_user.posts.create!(post_params)
    if post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    @posts = current_user.posts.all
  end

  def show
    @post = Post.find(params[:id])
    if @post.nil? 
      redirect_to root_path
    end
    @post.increase_view_times
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if !@post.nil? 
      @post.destroy
    end

    redirect_to root_path
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end


  def add
  end
  
  def save
    tempfile = params[:post_text][:uploaded_post].tempfile
    content = tempfile.read

    line=1
    str_title=String.new
    str_category=String.new

    content.gsub!(/\r\n?/, "\n")
    content.each_line do |l|
      if line==1
        str_title=l
      end

      if line == 2
        str_category=l
        break
      end
      line += 1
    end

    #str_title.chomp!
    str_category.chomp!
    category = Category.find_by_name(str_category)
    if category.nil?
      category = Category.create(:name=>str_category)
    end

    post = category.posts.build(:title=>str_title, :content=>content)
    if !post.save
      flash[:error] = "upload failed!"
    else
      flash[:success] = "upload success!"
    end
    
    render :action=>'add'
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

end
