class AccountsController < ApplicationController 
 get '/accounts/accounts' do
   @accounts = Account.all 
  erb :'/accounts/accounts'    
 end 
 
 get '/accounts/new' do
   @account = Account.new(account_number: params[:account_number], balance: params[:balance], user_id: params[:user_id])
   @account.save 
  erb :'accounts/new' 
 end 
 
 post '/accounts/new' do 
 
 end 
  
end 