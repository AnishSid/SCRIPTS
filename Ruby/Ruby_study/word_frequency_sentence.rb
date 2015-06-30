puts "enter the sentence: "
sentence = gets.chomp

puts "enter the word to find"
word = gets.chomp

def find_frequency(sentence, word)
    sentence.downcase.split.count(word.downcase)
end

#puts "You are %.2f years old" % how_old(age_in_seconds)
puts "world frequency  %.2f is" % find_frequency(sentence, word)
