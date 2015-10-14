$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONFIG[:twitter_consumer_key]
  config.consumer_secret     = CONFIG[:twitter_consumer_secret]
  config.access_token        = CONFIG[:twitter_access_token]
  config.access_token_secret = CONFIG[:twitter_access_secret]
end