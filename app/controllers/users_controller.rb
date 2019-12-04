# frozen_string_literal: true 

class UsersController < ApplicationController 
 
 
 post '/login' do 
   if !logged_in?
      erb :'users/login' 
    else 
      "redirect to accounts page"
    end 
 end 
 
 get '/signup' do 
   erb :'users/signup'
 end 
 
 post '/registration' do 
   if params[:password] == params[:confirm_password]
    @user = User.new(full_name: params[:name], username: params[:username], password: params[:password])
    @user.save 
    session[:user_id] = @user.id 
    redirect to "/accounts"
  else 
    "Passwords do not match"
    redirect to "/signup"
  end
 end 
 
 get '/accounts' do 
   erb :'accounts/accounts'
 end 
    
  
end 