require 'twitter'
require 'net/http'
require 'json'

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end

twitter_usernames = []

http = Net::HTTP.new('cfa-api.herokuapp.com')
response = http.request(Net::HTTP::Get.new("/v0/fellows"))
all_fellows_json = JSON.parse(response.body)
if all_fellows_json
  all_fellows_json.each do |fellow|
    twitter_username = fellow['fellow']['twitter']
    twitter_usernames.push(twitter_username) unless twitter_username == "ajones446"
  end
end

fellows = Hash.new({ value: 0 })

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1d', :first_in => 0 do |job|
	twitter_usernames.each do |twitter_username|
  	total_tweets = Twitter.user(twitter_username).statuses_count
  	fellows[twitter_username] = { label: twitter_username, value: total_tweets }
  end

  #sort by most tweets
  sorted = fellows.sort_by { |k,v| -v[:value] } # this is an array
  top_10 = sorted[0..9] # this is an array

  #convert array to hash
  top_10_hash = Hash[*top_10.flatten]

  send_event('most_tweets', { items: top_10_hash.values })

end