hash =  { :one => 1, :two => 2, :three => 3 }

keys = hash.keys
inspect = hash.inspect

puts "#{keys}"
puts "#{inspect}"

puts hash.each { |key,value| block }
