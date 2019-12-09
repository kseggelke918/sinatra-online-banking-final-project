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
  @account = Account.new(account_type: params[:account_type], opening_deposit: params[:opening_deposit], user_id: params[:user_id])
  @account.save 
 end 

  get '/accounts/:id' do
   @user = User.find_by_id(params[:id])
   erb :'accounts/accounts'
  end 
 

  
end 