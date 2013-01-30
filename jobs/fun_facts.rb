require 'net/http'
require 'json'

SCHEDULER.every '10m', :first_in => 0 do |job|
  data = JSON.parse(File.open('data/fun_facts.json','r').read)
  
  fun_facts =[]
  data.each do |key, value|
      fun_facts.push({ name: key, body: value }) unless value.empty?
  
  end
  
  send_event('fun_facts', comments: fun_facts)
end
