class Post < ActiveRecord::Base
  has_one :category
end
