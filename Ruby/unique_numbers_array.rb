print "Enter the number:"

number = gets.chomp.to_i

def number_shuffle(number)
    no_of_combinations = number.to_s.size == 3 ? 6 : 24
    digits = number.to_s.split(//)
    combinations = []
    combinations << digits.shuffle.join.to_i while combinations.uniq.size!=no_of_combinations
    combinations.uniq.sort
end

print number_shuffle(number)
