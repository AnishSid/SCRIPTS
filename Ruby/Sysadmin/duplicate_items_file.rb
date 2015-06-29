#!/usr/bin/env -ruby

puts 'What is the name and path of the file?'

filename = gets.chomp
text = String.new

File.open(filename) { |f| text = f.read }
words = text.split(/[^a-zA-Z]/)

frquency = Hash.new(0)
words.each { |word| frquency[word] += 1 }

frquency = frquency.sort_by {|x,y| y }
     frquency.reverse!
frquency.each {|word, freq| puts word+' '+freq.to_s}
