two_dimensional_array = [["apples", "bananas", "cherries"], [1,2,3], ["Alpha", "Beta", "Charlie"]]

dbl_hash = {
  "Chicago"=>{
     "nickname"=>"The Windy City",
     "state"=>"Illinois",
     "area in sq. mi."=> 234.0},
  "New York City"=>{
     "nickname"=>"The Big Apple",
     "state"=>"New York",
     "area in sq. mi."=> 468.9}
}

puts two_dimensional_array[2][1]
puts two_dimensional_array[1].join(',')
puts dbl_hash["Chicago"]["area in sq. mi."]
