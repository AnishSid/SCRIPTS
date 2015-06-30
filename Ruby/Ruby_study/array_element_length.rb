puts "input elements to array: "
input_array = gets.chomp

def length_finder(input_array)
    input_array.map {|element| element.length}
end

puts length_finder(input_array)

