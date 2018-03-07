class Tweet
  include Mongoid::Document

  field :tweet_id, type: String
  field :contents, type: String
  field :date_posted, type: DateTime
  field :user_id, type: Integer
  field :hashtags, type: Array
  field :mentions, type: Array
  store_in collection: 'tweets'
end
