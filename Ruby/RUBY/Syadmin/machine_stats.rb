def started
     Time.now - IO.read('/proc/uptime').split[0].to_i
end

def self.processor_count
`cat /proc/cpuinfo | grep processor | wc -l`.to_i
end

def memory_usage
 output = %x(free)
total_memory_usage_in_k = `ps -Ao rss=`.split.map(&:to_i).inject(&:+)
end

puts "#{memory_usage/1024} USED in Mbytes"
puts "uptime for your box is #{started}"
puts "number of CPU's for this machine is #{self.processor_count}"
