puts "Input a string"

string = gets.chomp

def reverse_string(string)
    string.split(' ').reverse{|x, y| x.length <=> y.length}.join(' ')
end

puts reverse_string(string)
