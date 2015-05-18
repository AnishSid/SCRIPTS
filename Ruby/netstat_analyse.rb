require 'optparse'
require 'scanf'

options = {}

optparse = OptionParser.new do |opts|
    opts.on('-w', '--warn warning') do |f|
          options[:warn] = f
            end
      opts.on('-c', '--critical critical') do |f|
            options[:crit] = f
              end
end

optparse.parse!

raise OptionParser::MissingArgument if options[:warn].nil?
raise OptionParser::MissingArgument if options[:crit].nil?

@src_ips = Hash.new(0)
@dst_ips = Hash.new(0)
@count = 0
exit_code = 0

File.readlines('/proc/net/tcp').each do |line|
    i = line.split(' ')
      if i[3] == '03'
            @count += 1
                @dst_ips[i[1].split(':')[0].scanf('%2x'*4)*"."] += 1
                    @src_ips[i[2].split(':')[0].scanf('%2x'*4)*"."] += 1
                      end
end

msg = "SYN Count: #{@count}"

if @count > options[:crit].to_i or @count > options[:warn].to_i
    top_dst_ip = @dst_ips.max_by{|k,v| v}
      top_src_ip = @src_ips.max_by{|k,v| v}
        crit = "| DST: #{top_dst_ip[0].split('.').reverse.join('.')}: #{top_dst_ip[1]} SRC: #{top_src_ip[0].split('.').reverse.join('.')}: #{top_src_ip[1]}"
          if @count.to_i > options[:crit].to_i
                exit_code = 2
                    msg = "SYN FLOOD CRITICAL #{msg} #{crit}"
                      elsif @count.to_i > options[:warn].to_i
                            exit_code = 1
                                msg = "SYN FLOOD WARN #{msg} #{crit}"
                                  end
end

puts msg
exit exit_code
