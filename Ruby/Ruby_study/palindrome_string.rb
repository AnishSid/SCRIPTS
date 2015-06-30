puts "Input a string to check if its a palindrome"
str = gets.chomp

def palindrome?(str)
   if str == str.reverse
    puts "#{str} : its a palindrome"
   else
    puts "#{str} : its not a palindrome"
   end
end

puts palindrome?(str)

