class User < ActiveRecord::Base 
  has_secure_password 
  has_many :accounts
  validates_uniqueness_of :username { message: "username already taken" }
  
  
end 