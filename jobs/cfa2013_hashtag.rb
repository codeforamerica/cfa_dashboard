require 'twitter'

Twitter.configure do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.oauth_token = ENV["TWITTER_OAUTH_TOKEN"]
  config.oauth_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
end

tweets = []

SCHEDULER.every '10m', :first_in => 0 do |job|
  results = Twitter.search("#cfa2013").results
  if results
    results.each do |tweet|
      tweets.push({ name: tweet.from_user,
                    body: tweet.text,
                    avatar: tweet.profile_image_url_https })
    end
    send_event('cfa2013_hashtag', comments: tweets)
  end
end