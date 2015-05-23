puts "paste your document here: "
document = gets.chomp

puts "remove what:? "
remove = gets.chomp

puts "and replace with:? "
replace = gets.chomp

target_words = document.split(" ")

target_words.each do |word|
  if word != remove
    print word + (" ")
  else  puts replace  + (" ")
  end
end
