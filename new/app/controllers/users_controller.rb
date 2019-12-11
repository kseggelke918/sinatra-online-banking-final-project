require 'pry'

class UsersController < ApplicationController

  get '/signup' do 
    erb :'users/signup' 
  end 
  
  post '/login' do 
    @user = User.find_by(username: params[:username])
   
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect to "/#{@user.id}/accounts"
    else 
      @errors = ["Invalid Username or Password"]
      erb :failure  
    end 
  end 
  
  post '/signup' do 
    if params[:password] == params[:confirm_password]
      @user = User.new(full_name: params[:full_name], username: params[:username], password: params[:password])
      @user.save 
      session[:user_id] = @user.id 
      redirect to "/#{@user.id}/accounts"
    else 
      @errors = ["Passwords do not match"]
      erb :failure 
    end 
  end 
  
  get '/:id/accounts' do 
    @user = User.find_by_id(params[:id])
    @accounts = @user.accounts 
    erb :'accounts/accounts'
  end 
  
  get '/users/:id/edit' do 
    @user = User.find_by_id(params[:id])
    erb :'users/edit' 
  end 
  
  patch '/users/:id' do 
    @user = User.find_by_id(params[:id])
    
    @user.username = params[:new_username] if params[:new_username] != ""
    @user.full_name = params[:new_name] if params[:new_name] != ""
    
    if params[:current_password] != "" && params[:new_password] != "" && params[:confirm_password] != "" 
      if @user.authenticate(params[:current_password]) && params[:new_password] == params[:confirm_password]
        @user.password = params[:new_password]
      else 
        @errors = ["The current password entered is incorrect or the new passwords do not match"]
      end 
    end 
      @user.save 
      redirect to "/#{@user.id}/accounts"
  end
 
  
  get '/logout' do 
    session.clear 
    redirect '/'
  end 
  
end 
