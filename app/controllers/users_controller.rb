# frozen_string_literal: true 
require 'pry'
class UsersController < ApplicationController 
 
 get '/login' do 
   erb :'users/login' 
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
 
 get 'users/:id/edit' do 
  @user = User.find_by_id(params[:id])
  erb :edit 
 end 
 
 patch 'users/:id' do 
   @user=User.find_by_id(params[:id])
   @user.username = params[:username]
   @user.full_name = params[:full_name]
   @user.save 
   redirect to "/users/#{user.id}"
 end 
 
 get '/logout' do 
   session.clear 
   redirect '/'
 end 
 
    
  
end 