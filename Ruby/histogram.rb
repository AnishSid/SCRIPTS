puts "write a string:"
text = gets.chomp
text.downcase!
words = text.split

frequencies = Hash.new(0)

words.each {|item| frequencies[item] +=1}

frequencies = frequencies.sort_by {|item, amount|amount}

frequencies.each do |item,amount|
  puts item + " " + amount.to_s
end
