#!/usr/bin/env ruby

=begin
Load the required Gems
=end

require 'socket'
require 'facter'
require 'sys/filesystem'
require 'free_disk_space'
require 'system/getifaddrs'

def started
     Time.now - IO.read('/proc/uptime').split[0].to_i
end

def self.processor_count
     Facter.value('processors')['count']
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

def check_disk_space
FreeDiskSpace.gigabytes('/').to_i
end

def self.list_all_devices()
      devicehash = System.get_ifaddrs # {:eth0=>{:inet_addr=>"18.248.7.89", :netmask=>"18.248.7.89"}, :vmnet1=>{:inet_addr=>"172.16.76.1", :netmask=>"172.16.76.1"}}
      devicehash.keys
end 

def self.list_all_devices_macaddr()
      devices = self.list_all_devices
      device_macaddrs = {}
      devices.each do |eth_device|
      device_macaddrs[eth_device] = self.mac(eth_device.to_s).unpack('H*')[0]
      device_macaddrs
end 
end

plimit_soft = Process.getrlimit(:NOFILE)[1]
plimit_hard = Process.getrlimit(:NOFILE)[0]

puts "REDHAT VERSION: #{redhat_release}" 
puts "KERNEL: #{kernel_version}"
puts "UPTIME: #{started}"
puts "CPU CORES: #{self.processor_count}"
puts "NETWORK INTERFACES & IP's :  #{self.list_all_devices} #{Socket.getifaddrs.map { |i| i.addr.ip_address if i.addr.ipv4? }.compact}"
puts "kernel: #{Facter.value(:kernel)}"
puts "file descriptor soft_limit : #{plimit_soft} and hard_limit : #{plimit_hard} "
puts "DISK USAGE: #{check_disk_space}GB"
