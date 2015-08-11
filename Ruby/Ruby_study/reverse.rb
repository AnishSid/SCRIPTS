puts "enter the string"
str = gets.chomp

def reverse_last2(str)
    word = str.split(' ')
      reverse_str = []

        word.length.times do |i|
              reverse_str[i] = word[i].reverse
                end
          return reverse_str.join(" ")
end
puts reverse_last2(str)


