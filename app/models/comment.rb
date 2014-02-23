class Comment < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 128}, format: { with:VALID_EMAIL_REGEX }
  validates :content, presence: true, length: {maximum: 255}
  validates :website, length: {maximum: 255}

  belongs_to :post
  
end
