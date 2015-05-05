puts "Input the Number:"

range1 = (a..b).to_a
def sum_of_cubes(a, b)
    (a..b).inject(0) { |sum, x| sum += (x*x*x) }
end

puts sum_of_cubes(a, b)
