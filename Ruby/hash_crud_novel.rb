#/usr/bin/env ruby


books = {
  wheel_of_time: 6,
  Anishsid: 5,
  Smitha: 6
}

puts "what  you want?  OPTIONS : add, delete,update,list: "

choice = gets.chomp

 case choice
 when "add"
   puts "what book you wanna add to your book?  "
   title = gets.chomp
   if books[title.to_sym] .nil?
   puts "What rating do you give this book? Between 1 and 10 "
   rating = gets.chomp
   books[title.to_sym] = rating.to_i
   puts "#{title} has been added to books with a rating of #{rating}"
 else puts "thats alreadt in your hash "
  end

  when "update"
     puts "what books rating you wanna update: ? "
     title = gets.chomp
     if books[title.to_sym] .nil?
       puts "Error ! books not found!!"
     else puts  "whats the new rating you want: ? "
       rating = gets.chomp
       books[title.to_sym] = rating.to_i
       puts "your rating for #{title} has been updated to #{rating}!!"
     end
puts books
  when "delete"
     puts "what tital you wanna remove: ??"
     title = gets.chomp.to_sym
     if books[title.to_sym] .nil?
     puts "That title doesnt exists anyways!! "
     else books.delete(title)
   end

  when "list"
    books.each do |book, rating|
      puts "#{book} : #{rating}"
    end
 else
   puts "ERRROR! not the valid input BRO!!"
 puts books
 end
