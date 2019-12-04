require 'bundler/setup'
Bundler.require 

require_relative '../app/models/user.rb'
require_relative '../app/models/account.rb'
require_relative '../app/controllers/application_controller.rb'
require_relative '../app/controllers/users_controller.rb'
require_relative '../app/controllers/accounts_controller.rb'