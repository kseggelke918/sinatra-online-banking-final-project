class Account < ActiveRecord::Base
  belongs_to :user 
  validates_uniqueness_of :account_number 
  
  # def initialize(args ={}) 
  #   args[:account_number] ||= account_number_generator
  # end 
  
  # def account_number_generator
  #   rand(111111..999999)
  # end 
  
end 