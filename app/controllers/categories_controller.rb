class CategoriesController < ApplicationController
  before_filter :fetch_all_category

  def new
  end

  def create
    category = Category.create(:name=>params[:new_category][:name])
    if category.nil?
      redirect_to root_path
    end

    redirect_to root_path 
  end

  def index
  end

  def show
    @posts = Post.where("category_id=?", params[:id])
    render :template =>'static_pages/posts'      
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    redirect_to root_path 
  end

  def update
  end

end
