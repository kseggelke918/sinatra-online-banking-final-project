# frozen_string_literal: true 
require 'pry'
class UsersController < ApplicationController 
 
 
 get '/login' do 
   erb :'users/login' 
 end 
 
 post '/users/login' do 
   user = User.find_by(username: params[:username])
   
   if user && user.authenticate(params[:password])
    session[:user_id] = user.id 
    redirect '/accounts/accounts'
   else 
    @errors = ["Invalid Username or Password"]
    erb :failure  
   end 
   
 end 
 
 get '/users/signup' do 
   erb :'users/signup'
 end 
 
 post '/signup' do 
   # ToDo: tweek conditional statement so that if a user is already found, they are brought into the login page
   if params[:password] == params[:confirm_password]
    @user = User.new(full_name: params[:name], username: params[:username], password: params[:password])
    @user.save 
    session[:user_id] = @user.id 
    redirect to "/accounts/new"
  else 
    @errors = ["Passwords do not match"]
    erb :failure
  end
 end 
 
 get '/accounts' do 
   erb :'accounts/accounts'
 end 
 
 get '/users/logout' do 
   session.clear 
   redirect '/'
 end 
 
    
  
end 