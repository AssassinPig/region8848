class User < ActiveRecord::Base
  has_many :posts

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password
  validates :name, :presence=>true, :length => { :minimum => 4, :maximum => 20 }, :uniqueness => true 
  validates :email,:presence=>true, :uniqueness => { :case_sensitive =>false}, :format => { :with => email_regex} 
  validates :password, :length => { :minimum => 6 }, :on => :create
  before_create { generate_token(:token) }

  def generate_token(column)
    begin 
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
