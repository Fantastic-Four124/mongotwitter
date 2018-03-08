# server.rb
require 'sinatra'
require 'mongoid'
require_relative 'models/tweet'

# DB Setup
Mongoid.load! "mongoid.config"

#set binding
enable :sessions

set :bind, '0.0.0.0' # Needed to work with Vagrant

# These are by no means concrete.

# Testing routes only.
get '/' do
  erb :home
end

get '/results' do
  @text = params[:load]
  erb :results
end

# Read the first Tweet that matches the query.
get '/read' do
  tweet = Tweet.find_by(user_id: 1)
  message = "Tweet message: #{tweet.contents}"
  redirect "/results?load=#{message}"
end

post '/create' do
  tweet = Tweet.new(
    contents: params[:tweet],
    user_id: 1,
    date_posted: Time.now,
    hashtags: ['twitter'],
    mentions: Array.new
  )
  tweet.save!
  message = "Tweet with #{tweet.id} created."
  redirect "/results?load=#{message}"
end

# Delete the first Tweet that matches the query.
post '/delete' do
  tweet = Tweet.find_by(user_id: 1)
  message = "Tweet with #{tweet.id} deleted."
  tweet.delete
  redirect "/results?load=#{message}"
end

get '/api/v1/tweets/:user_id' do # Get tweets by :user_id

end

get '/api/v1/tweets/random' do # Get 50 random tweets

end

get '/api/v1/tweets/:tweet_id/hashtags' do # Get hashtags associated with the tweet

end

get '/api/v1/tweets/:tweet_id/mentions' do # Get mention associated with the tweet

end
