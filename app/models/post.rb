class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  def increase_view_times
    update_attributes(:view_times=>view_times+1)
  end

end
