class Category < ActiveRecord::Base
  has_many :posts
  validates :name, length: {maximum:48}, presence: true
end
