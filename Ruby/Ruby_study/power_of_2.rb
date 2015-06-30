puts "Input the number:"

n = gets.to_i
def ispow2(n)
  n & (n – 1) == 0
end

puts ispow2(n)
