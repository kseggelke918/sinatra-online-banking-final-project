class Account < ActiveRecord::Base
  belongs_to :user 
  validates_uniqueness_of :account_number 
  
  def initialize(args = {}) 
    args[:account_number] ||= account_number_generator
    super 
  end 
  
  def account_number_generator
    acct_num = rand(111111..999999)
    
    if Account.exists?(account_number: acct_num)
      acct_num = rand(111111..999999) 
    end 
    
    acct_num
    
  end 

  
end 