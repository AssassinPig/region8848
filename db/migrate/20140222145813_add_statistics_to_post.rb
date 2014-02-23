class AddStatisticsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :view_times, :integer, default:0 
  end
end
