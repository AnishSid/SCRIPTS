require_relative 'lib/memory_usage_monitor.rb'

mm = MemoryUsageMonitor.new
mm.start

sum = 0
items = []
5_000_000.times do |n|
  sum += n
  items << n.to_s if rand > 0.8
end

mm.stop
puts "Peak memory: #{mm.peak_memory/1024} MB"
