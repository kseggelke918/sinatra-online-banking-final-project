# frozen_string_literal: true 

class UsersController < ApplicationController 
 
 
 get '/login' do 
   erb :login 
 end 
 
 post '/login' do 
   user = User.find_by(username: params[:username])
   
   if user && user.authenticate(params[:password])
    session[:user_id] = user.id 
    redirect '/accounts/accounts'
   else 
    @errors = ["Invalid Username or Password"]
    erb :failure  
   end 
   
 end 
 
 get '/signup' do 
   erb :'users/signup'
 end 
 
 post '/registration' do 
   # ToDo: tweek conditional statement so that if a user is already found, they are brought into the login page
   if params[:password] == params[:confirm_password]
    @user = User.new(full_name: params[:name], username: params[:username], password: params[:password])
    @user.save 
    session[:user_id] = @user.id 
    redirect to "/accounts/new"
  else 
    @error = ["Passwords do not match"]
    redirect to "/failure"
  end
 end 
 
 get '/accounts' do 
   erb :'accounts/accounts'
 end 
 
    
  
end 