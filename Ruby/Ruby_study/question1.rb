#!/usr/bin/env ruby

f = open("odd1.txt")
contents_array = []
f.each_line { |line| contents_array << line }
f.close
#puts contents_array


contents_array.each do |f|
  if  f % 2 == 0
   puts "#{f} is even"
   elsif f % 2 == 1
   puts "#{f} is odd"
   else
  puts "#{f} is nnthing"
  end
end


