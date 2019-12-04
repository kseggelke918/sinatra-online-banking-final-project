# frozen_string_literal: true 

class UsersController < ApplicationController 
 
 
 post '/users/login' do 
   if !logged_in?
      erb :login 
    else 
      "redirect to accounts page"
    end 
 end 
 
 get '/users/signup' do 
   erb :signup
 end 
    
  
end 