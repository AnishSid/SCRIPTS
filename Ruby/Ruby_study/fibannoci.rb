arr = 18.times.inject([0,1]) do |a, idx|
      a << a[-2] + a[-1]
end
puts arr.join(', ')

