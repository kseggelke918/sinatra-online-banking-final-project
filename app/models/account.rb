class Account < ActiveRecord::Base
  belongs_to :user 
 
  
  def initialize(args = {}) 
    args[:account_number] ||= account_number_generator
    super 
  end 
  
  def account_number_generator
    acct_num = rand(111111..999999)
    
    while Account.exists?(account_number: acct_num)
      acct_num = rand(111111..999999) 
    end 
    
    acct_num
    
  end 

  
end 