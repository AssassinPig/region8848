class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.integer :user_id
      t.integer :view_times, default:0 

      t.timestamps
    end

    add_index :posts, :category_id
    add_index :posts, :user_id
  end
end
