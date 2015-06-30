#Write a program which prints out all numbers between 1 and 100. When the program would print out a number exactly divisible by 4, #print "Linked" instead. When it would print out a number exactly divisible by 6, print "In" instead. When it would print out a #number exactly divisible by both 4 and 6, print "LinkedIn."

count = Array.new(100) {|x| x+1}

test = count[90]
puts "90th element is #{test}"

 count.each do |x|
    if  x % 6  &&  x % 4 == 0
     puts "#{x} is LinkedIn"
     elsif x % 4 == 0
     puts "#{x} is Linked"
     elsif x % 6 == 0
     puts "#{x} is LN"
     else
     puts "#{x} is not divisible by 4 or 6 or both"
  end
end
