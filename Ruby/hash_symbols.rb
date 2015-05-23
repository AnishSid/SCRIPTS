#/usr/bin/env ruby

hash = {
  jackson: 17,
  sarah: 10,
  anish: 34
}

old_enough = hash.select {|k,v| v > 21}
puts old_enough
