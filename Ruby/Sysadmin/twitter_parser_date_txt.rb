require 'rubygems'
require 'rest-client'
require 'crack'

URL = "http://ruby.bastardsbook.com/files/tweet-fetcher/tweets-data/USAGov-tweets-page-2.xml"
response = RestClient.get(URL)

if response.code == 200
     xml = Crack::XML.parse(response.body)
     xml["statuses"].each do |status_el|
     puts status_el["text"]
     puts status_el["created_at"]
     puts "--- \n"
     end
else
     puts "Service is currently down??"
end
