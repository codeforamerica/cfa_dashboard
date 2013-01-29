require 'net/http'
require 'json'

search_term = URI::encode('#cfa2013')

SCHEDULER.every '10m', :first_in => 0 do |job|
  http = Net::HTTP.new('search.twitter.com')
  response = http.request(Net::HTTP::Get.new("/search.json?q=#{search_term}"))
  tweets = JSON.parse(response.body)["results"]
  if tweets
    tweets.map! do |tweet| 
      { name: tweet['from_user'], body: tweet['text'], avatar: tweet['profile_image_url_https'] }
    end
  
    send_event('cfa2013_hashtag', comments: tweets)
  end
end