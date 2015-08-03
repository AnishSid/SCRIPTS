names = ["John Smith", "Dan Boone", "Jennifer Jane", "Charles Lindy", "Jennifer Eight", "Rob Roy"]
sorted_names = names.sort_by do |name|
     name.split(" ").reverse.join.upcase
end

puts sorted_names.join('; ')
