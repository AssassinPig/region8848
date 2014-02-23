class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, :id, unique:true
  end
end
