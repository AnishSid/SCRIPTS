puts "Input a string to check if its a palindrome"

sentence = gets.chomp

def palindrome?(sentence)
    downcase_stripped_sentence = sentence.downcase.gsub(" ", "")
    if
    downcase_stripped_sentence  ==  downcase_stripped_sentence.reverse
    puts "#{sentence} : its a palindrome"
    else
    puts "#{sentence} : its not  a palindrome"
    end
end

puts palindrome?(sentence)
