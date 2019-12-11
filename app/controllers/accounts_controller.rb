class AccountsController < ApplicationController
 
 get '/accounts/new' do
   @user = User.find_by_id(params[:id])
   erb :'accounts/new'
 end 
 
 post '/accounts' do 
  if logged_in?
    @user = current_user
    @account = Account.new(account_type: params[:account_type], balance: params[:balance], user_id: @user.id, account_number: rand(111111..999999))
    @account.save 
    redirect to "/#{@user.id}/accounts"
  else
    redirect to '/login'
  end    
 end 
 
 delete '/accounts/:id/delete' do 
   @user = current_user
   @account = Account.find_by_id(params[:id])
   @account.delete 
   redirect to "/#{@user.id}/accounts" 
 end 
  
end 
