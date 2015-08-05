contracts_arr =     ["Hughes Missile Systems Company, Tucson, Arizona, is being awarded a $7,311,983 modification to a firm fixed price contract for the FY94 TOW missile production buy, total 368 TOW 2Bs. Work will be performed in Tucson, Arizona, and is expected to be completed by April 30, 1996. Of the total contract funds, $7,311,983 will expire at the end of the current fiscal year. This is a sole source contract initiated on January 14, 1991. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-92-C-0260)."]

contracts_arr.each do |contract|
  mtch = contract.match(/\$[\d,]+/)
  mtch1 = contract.match(/\w+ \d{1,2}, \d{4}/)
  mtch2 = contract.match(/(\w+) (\d{1,2}), (\d{4})/)
  mtch3 = contract.match(/\b(.{10,20}) (\w+ \d{1,2}, \d{4})/)
  mtch4 = contract.match(/(\$[\d,]+).+?(\w+ \d{1,2}, \d{4})/)

  puts mtch
  puts mtch1
  puts mtch2
  puts mtch3
  puts mtch4
end
