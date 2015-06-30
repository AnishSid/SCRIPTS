ark = ['cat', 'dog', 'pig', 'goat']
ark2 = ark.each_with_index.map do |a, i|
     if i % 2 == 1
     a.capitalize.reverse
     else
     a
 end
end
puts ark2.join(', ')
