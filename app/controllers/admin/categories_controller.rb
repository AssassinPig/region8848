class Admin::CategoriesController < Admin::ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.create!(category_params)
    if category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_category_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  def show 
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
