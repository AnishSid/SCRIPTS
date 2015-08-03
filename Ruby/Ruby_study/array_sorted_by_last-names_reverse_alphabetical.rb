presidents = [
  {:last_name=>"Clinton", :first_name=>"Bill", :party=>"Democrat", :year_elected=>1992, :state_residence=>"Arkansas"},
  {:last_name=>"Obama", :first_name=>"Barack", :party=>"Democrat", :year_elected=>2008, :state_residence=>"Illinois"},
  {:last_name=>"Bush", :first_name=>"George", :party=>"Republican", :year_elected=>2000, :state_residence=>"Texas"},
  {:last_name=>"Lincoln", :first_name=>"Abraham", :party=>"Republican", :year_elected=>1860, :state_residence=>"Illinois"},
  {:last_name=>"Eisenhower", :first_name=>"Dwight", :party=>"Republican", :year_elected=>1952, :state_residence=>"New York"}
]

#Sort presidents by last name in reverse alphabetical order.
puts presidents.sort_by{ |hsh| hsh[:last_name] }.reverse

#Create a :full_name key for each hash and set its value to a string in "LASTNAME, FIRSTNAME" format. Then sort the collection, first by party affiliation and then by the full name field.

