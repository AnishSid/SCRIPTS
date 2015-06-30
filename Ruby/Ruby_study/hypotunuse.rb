 #!/usr/bin/env ruby

print "a "
a = gets.to_i
print "b "
b = gets.to_i

a2 = a**2
b2 = b**2
c2 = a2 + b2
puts "answer is #{ Math.sqrt(c2)}"

