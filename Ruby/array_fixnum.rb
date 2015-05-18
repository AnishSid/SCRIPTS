print "Enter the number:"

array= []
array=gets.chomp.to_i


def array_of_fixnums?(array)
    array.all? { |x| x.is_a? Fixnum }
end

array_of_fixnums?(array)

