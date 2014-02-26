module CategoriesHelper
  def get_category_tag(id)
    category = Category.find(id)
    if category.nil?
      category.name = "default category" 
    end
    category.name
  end
end
