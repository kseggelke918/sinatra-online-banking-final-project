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
 
 post '/:id/delete' do 
   @account = Account.find_by_id(params[:id])
   @account.delete 
   redirect to "/#{@user.id}/accounts" 
 end 
  
end 









# class AccountsController < ApplicationController 
# get '/accounts/accounts' do
#   if logged_in?
#     @user = User.find_by_id(params[:id])
#     @accounts = @user.accounts 
#     erb :'/accounts/accounts'  
#   else 
#     redirect to '/login'
#   end 
# end 
 
# get '/accounts/new' do
#   if logged_in?
#     erb :'accounts/new'
#   else 
#     redirect to '/login'
#   end 
# end 
 
# post '/accounts' do 
#   if logged_in?
#     @account = Account.new(account_type: params[:account_type], balance: params[:balance], user_id: params[:user_id], account_number: rand(111111..999999))
#     @account.save 
#     redirect to "accounts/#{@account.id}"
#   else
#     redirect to '/login'
#   end 
# end 

#   get '/accounts/:id' do
#     if logged_in?
#       @user = User.find_by_id(params[:id])
#       @accounts = @user.accounts 
#       binding.pry 
#       erb :'accounts/accounts' 
#     else 
#       redirect to '/login'
#     end 
#   end 
  
#   delete '/accounts/:id/delete' do 
#     if logged_in?
#       @account = Account.find_by_id(params[:id])
#       @account.delete if @account && @account.user == current_user 
#       redirect to '/accounts/accounts'
#     else 
#       redirect to '/login'
#     end 
#   end 
  
  
# end 