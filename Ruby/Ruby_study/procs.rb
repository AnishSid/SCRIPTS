people_one = [54, 67, 76, 12, 5, 21]

over_thirty = Proc.new { |age| age > 30 }
over_twenty_one = Proc.new { |age| age >= 21}

group_one = people_one.select(&over_thirty)
group_two = people_one.select(&over_twenty_one)

print group_one
print group_two
