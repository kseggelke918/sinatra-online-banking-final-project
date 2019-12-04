class UsersController < ApplicationController 
 
 
 post '/login' do 
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