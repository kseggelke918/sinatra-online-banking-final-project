class UsersController < ApplicationController 
 
 
 get '/login' do 
   if !logged_in?
      erb :login 
    else 
      "redirect to accounts page"
    end 
 end 
 
 get '/signup' do 
   erb :signup
 end 
    
  
end 