class User < ActiveRecord::Base 
  has_secure_password 
  has_many :accounts
  
  validates_presence_of :full_name, :username, :password 
  
end 