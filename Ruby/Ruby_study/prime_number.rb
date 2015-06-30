#PRIME NUMBERS

puts "Starting number"
first = gets.to_i

puts "ending number"
last = gets.to_i


puts "here are the results"


while (first <=last)
 prime_true = true

 x=2

while (x <= first/2)

   if (first % x ==0)
    prime_true = false
    break
   end

x +=1

end

if prime_true
  puts "A prime number > " + first.to_s
end

 first += 1

end
