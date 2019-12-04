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
  else 
    "Passwords do not match"
    redirect to "/users/signup"
  end
 end 
    
  
end 