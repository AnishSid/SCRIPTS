#!/usr/bin/env ruby
#
# Calculate I/O stats from the output of 'iostat -x'
#
# This is to take the output from 'iostat -x' and receive it on stdin.
#
#   % iostat -x | ./report.rb
#
fields = {
  'rrqm/s'   => 1,
  'wrqm/s'   => 2,
  'r/s'      => 3,
  'w/s'      => 4,
  'avgrq-sz' => 7,
  'avgqu-sz' => 8,
  'await'    => 9,
  'svctm'    => 10,
}

sums  = Hash.new { |h,k| h[k] = 0 }
count = 0
ARGF.each do |line|
  line.strip!
  parts = line.split
  next unless parts.size == 12
  next unless parts[0] =~ /\d+\Z/

  fields.each do |key, offset|
    sums[key] += Float(parts[offset])
  end
  count += 1
end

total_read  = sums['r/s']
total_write = sums['w/s']
total       = total_read + total_write
puts "Number of mounted devies                     : #{count}"
puts "Total IOPS                                   : #{"%7.2f" % total}"

pct_read = (total_read / total) * 100.0
puts "Read IOPS                                    : #{"%7.2f" % total_read} (#{"%0.2f" % pct_read}% of Total IOPS)"

pct_write = (total_write / total) * 100.0
puts "Write IOPS                                   : #{"%7.2f" % total_write} (#{"%0.2f" % pct_write}% of Total IOPS)"

avg_q_depth = sums['avgqu-sz'] / count
puts "Average I/O queue depth                      : #{"%7.5f" % avg_q_depth}"

avg_q_req_size = sums['avgrq-sz'] / count
puts "Average count of sectors in each I/O request : #{"%7.5f" % avg_q_req_size}"

avg_req_time = sums['await'] / count
puts "Average time for an I/O request to be served : #{"%7.5f" % avg_req_time} milliseconds"
