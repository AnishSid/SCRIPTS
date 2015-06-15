
my_friends = ["Mike", "smitha", "neha"]

puts "your currently have #{my_friends} in the array. Add more please : "
 new_friend = gets.chomp

 my_friends << new_friend

 last_friend = "Anish"

 puts "My top friends are #{my_friends.join(', ')},"<<" and " << last_friend << " for a reason."

print  my_friends.unshift(last_friend)
print  my_friends.push(last_friend)
