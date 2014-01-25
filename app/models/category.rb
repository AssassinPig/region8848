class Category < ActiveRecord::Base
  has_one :post
end
