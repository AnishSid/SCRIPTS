require 'rubygems'
require 'rest-client'
require 'crack'

puts "enter the address : "
addr = gets.chomp

def get_coordinates_from_address(addr)
     base_google_url = "http://maps.googleapis.com/maps/api/geocode/xml?sensor=false&address="
     res = RestClient.get(URI.encode("#{base_google_url}#{addr}"))
     parsed_res = Crack::XML.parse(res)
     lat = parsed_res["GeocodeResponse"]["result"]["geometry"]["location"]["lat"]
     lng = parsed_res["GeocodeResponse"]["result"]["geometry"]["location"]["lng"]
     return "#{lat}, #{lng}"
end

puts "longitude & latitude is  #{get_coordinates_from_address(addr)}"
