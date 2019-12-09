class AccountsController < ApplicationController 
 get '/accounts/accounts' do
   if logged_in?
    @user = User.find_by_id(params[:id])
    @accounts = @user.accounts 
    erb :'/accounts/accounts'  
  else 
    redirect to '/login'
  end 
 end 
 
 get '/accounts/new' do
   if logged_in?
    erb :'accounts/new'
  else 
    redirect to '/login'
  end 
 end 
 
 post '/accounts' do 
  @account = Account.new(account_type: params[:account_type], balance: params[:balance], user_id: params[:user_id], account_number: rand(111111..999999))
  @account.save 
  redirect to "accounts/accounts"
 end 

  get '/accounts/:id' do
    if logged_in?
      @user = User.find_by_id(params[:id])
      @accounts = @user.accounts 
      erb :accounts 
    else 
      redirect to '/login'
    end 
  end 
  
  delete '/accounts/:id/delete' do 
    if logged_in?
      @account = Account.find_by_id(params[:id])
      @account.delete if @account && @account.user == current_user 
      redirect to '/accounts/accounts'
    else 
      redirect to '/login'
    end 
  end 
  
  
end 