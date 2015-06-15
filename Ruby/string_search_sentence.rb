
puts "enter the sentence:"
array = gets.chomp
puts "enter the string to search:"
query = gets.chomp

def findWord(query, array)
     a = array.grep(/#{query}/i)
        a.empty? ? ["Empty"] : a
end

