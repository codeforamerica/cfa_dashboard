require 'net/http'
require 'json'

SCHEDULER.every '10m', :first_in => 0 do |job|
  http = Net::HTTP.new('cfa-api.herokuapp.com')
  response = http.request(Net::HTTP::Get.new("/v0/fellows"))

  fellows = JSON.parse(response.body)
  if fellows
    fellows.map! do |fellow|
      f = fellow['fellow']
      { name: f['name'], 
        city: f['team'], 
        body: f['bio'].gsub("\"","").split(".")[0],
        avatar: f['headshot_url'] }
    end
  
    send_event('fellow_bios', comments: fellows)
  end
end
