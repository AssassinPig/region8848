class CategoriesController < ApplicationController
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
  end

  def destroy
      category = Category.find(params[:id])
      category.destroy

      redirect_to root_path 
  end

  def update
  end
end
