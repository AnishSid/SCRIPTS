h = {
  :one => 1,
  :two => 2,
  :four => 4
}

h[:three] = 3

h.each do |key,value|
  puts "#{value}:=>#{key},"
end

puts h
