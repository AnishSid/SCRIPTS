def devisible
   x = 1.upto(100) { |x| puts x }
     if x % 4 == 0
      puts "Linked"
      elseif x % 6 == 0
      puts "In"
      else x % 6  &&  x % 4 == 0
      puts "LinkedIn"
      end
end
end

puts devisible
