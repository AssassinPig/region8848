class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, :dependent => :destroy
  def increase_view_times
    update_attributes(:view_times=>view_times+1)
  end

end
