#!/usr/bin/env ruby

require 'tempfile'

=begin
Could be used to replace your default sysctl with hacked values. No rocket science just string replacements.
thats all
=end

#METHOD
def file_edit(filename, regexp, replacement)
  Tempfile.open(".#{File.basename(filename)}", File.dirname(filename)) do |tempfile|
    File.open(filename).each do |line|
      tempfile.puts line.gsub(regexp, replacement)
     end
     tempfile.fdatasync
     tempfile.close
     stat = File.stat(filename)
     FileUtils.chown stat.uid, stat.gid, tempfile.path
     FileUtils.chmod stat.mode, tempfile.path
     FileUtils.mv tempfile.path, filename
     end
     end

#KEEP  ADDING YOUR SYSCTL HACKS
file_edit('sysctl.example', /vm.swappiness=0/, "vm.swappiness=1")
file_edit('sysctl.example', /net.ipv4.tcp_wmem=4096 65536 16777216/, "net.ipv4.tcp_wmem=4096 65536 1677721699")


#RELOAD SYSCTL
puts "reload new sysctl variables"
cmd = '/sbin/sysctl -p /etc/sysctl.conf'
system(cmd)

