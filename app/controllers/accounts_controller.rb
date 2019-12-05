class AccountsController < ApplicationController 
 get '/accounts/accounts' do 
  erb :'/accounts/accounts'    
 end 
 
 get '/accounts/new' do 
  erb :'accounts/new' 
 end 
 
 post '/accounts/new' do 
 
 end 
  
end 