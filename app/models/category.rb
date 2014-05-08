class Category < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  validates :name, length: {maximum:48}, presence: true
end
