# server.rb
require 'sinatra'
require 'mongoid'

# DB Setup
Mongoid.load! "mongoid.config"

#set binding
enable :sessions

set :bind, '0.0.0.0' # Needed to work with Vagrant
