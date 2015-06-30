puts "provide your input:"

input = gets.chomp
puts "#{input}".scan(/\w/).inject(Hash.new(0)){|h, c| h[c] += 1; h}
