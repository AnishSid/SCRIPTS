require 'resolv'
require 'ipaddr'


contentsArray=[]
File.readlines('log').map do |line|
contentsArray =  puts line.split[2]

#array.each { |item| block }
def method
contentsArray.each do |x|
  if Resolv::IPv4::Regex
    puts "#{x} its IPv4"
  elsif Resolv::IPv6::Regex
    puts "#{x} its ipv6"
  else
    puts "i dont know"
  end
end
end
end

