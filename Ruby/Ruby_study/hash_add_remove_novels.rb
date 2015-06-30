#/usr/bin/env ruby

novel = {
  Green_Eggs: 5,
  Harry_potter: 8,
  Way_of_kings: 6,
}

answer = "yes"
while answer == "yes"
puts "wanna add another book? (type yes or no)"
answer = gets.chomp

 case answer
   when "yes"
     puts "what book you wanna add?"
     book = gets.chomp
     novel[book.to_sym]
     puts "what would be rating?"
     rating = gets.chomp
     novel[book.to_sym] = rating.to_i
     puts "#{book}  as been added to your hash with a rating of #{rating}!"
   when "no"
     puts "ok sounds good to me!!"
 end

end
puts "here is whats in your has now: #{novel}"
