#/usr/bin/env ruby

def sortedlist(potato)
  if
    reverse == false
    potato.sort {|a,b| a <=> b}
  else
    potato.sort {|a,b| b <=> a}
  end
end

disney_movies = ["lion king", "Little mermaid", "lady in the tram", "tangled"]

puts "IN reverse order: #{sortedlist}(disney_movies), false)}"

puts "IN backward order:  #{sortedlist}(disney_movies), true)}"
