class Account < ActiveRecord::Base
  belongs_to :user 
  
  def initialize(args ={}) 
    args[:account_number] ||= account_number_generator
  end 
  
  def account_number_generator
    rand(111111..999999)
  end 
  
end 