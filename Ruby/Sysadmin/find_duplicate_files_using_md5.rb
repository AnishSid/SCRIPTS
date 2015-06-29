#!/usr/bin/env ruby

puts "Enter the Directory to check: "
DIRNAME = gets.chomp

require 'digest/md5'

hash = {}

Dir.glob("#{DIRNAME}**/*", File::FNM_DOTMATCH).each do |filename|
  next if File.directory?(filename)

  key = Digest::MD5.hexdigest(IO.read(filename)).to_sym
  if hash.has_key? key
    hash[key].push filename
  else
    hash[key] = [filename]

 end
end


hash.each_value do |x|
 if x.length > 1
    puts "===### MD5 same and so assume identical ## ===\n"
    x.each { |filename| puts '  '+filename }
  end
end
