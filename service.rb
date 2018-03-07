# server.rb
require 'sinatra'
require 'mongoid'

# DB Setup
Mongoid.load! "mongoid.config"

#set binding
enable :sessions

set :bind, '0.0.0.0' # Needed to work with Vagrant

# These are by no means concrete.

GET '/api/v1/tweets/{:user_id}' do # Get tweets by :user_id

end

GET '/api/v1/tweets/random' do # Get 50 random tweets

end

GET '/api/v1/tweets/{:tweet_id}/hashtags' # Get hashtags associated with the tweet

end

GET '/api/v1/tweets/{:tweet_id}/mentions' # Get mention associated with the tweet

end
