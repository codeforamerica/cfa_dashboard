require 'nokogiri'
require 'open-uri'

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
	html  = Nokogiri::HTML open("http://www.randomfunfacts.com")
  fact = html.css("strong").text
  send_event('fact', { text: fact })
end