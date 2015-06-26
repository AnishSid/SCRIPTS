def started
     Time.now - IO.read('/proc/uptime').split[0].to_i
end

def self.processor_count
`cat /proc/cpuinfo | grep processor | wc -l`.to_i
end

def mem_total
`grep MemTotal /proc/meminfo | awk '{print $2}'`.to_i
end


def memory_usage
 output = %x(free)
total_memory_usage_in_k = `ps -Ao rss=`.split.map(&:to_i).inject(&:+)
end

def redhat_release
 if File.exist?("/etc/redhat-release")
 contents = File.read("/etc/redhat-release").chomp
 return contents
 else
 puts "not a Redhat box"
 end
end

def kernel_version 
 return platform_version = `uname -r`.strip
end


puts "REDHAT VERSION: #{redhat_release}" 
puts "KERNEL: #{kernel_version}"
puts "UPTIME: #{started}"
puts "CPU CORES: #{self.processor_count}"
