class AccountsController < ApplicationController 
 get '/accounts/accounts' do
   @accounts = Account.all 
  erb :'/accounts/accounts'    
 end 
 
 get '/accounts/new' do
  erb :'accounts/new' 
 end 
 
 post '/accounts/new' do 
  binding.pry 
  @account = Account.new(account_type: params[:account_type], balance: params[:balance], user_id: params[:user_id], account_number: rand(111111..999999))
  @account.save 
  redirect to "accounts/accounts"
 end 

  get '/accounts/:id' do
   @user = User.find_by_id(params[:id])
   @accounts = @user.accounts 
   erb :accounts 
  end 
  
  
 

  
end 