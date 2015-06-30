
class ApacheLog
  FORMATS = {
    :combined => %r{^(\S+) - - \[(\S+ \+\d{4})\] "(\S+ \S+ [^"]+)" (\d{3}) (\d+|-) "(.*?)" "([^"]+)"$}
  }

  class << self
    def each_line(log_file, log_format = FORMATS[:combined])

      f = File.open(log_file, "r")

      f.each_line do|line|
        data = line.scan(log_format).flatten

        if data.empty?
          p "Line didn't match pattern: #{line}"

          next
        end

        yield data
      end
    end
  end
end


log_file   = ARGV[0]

ApacheLog.each_line(log_file) do |data|
  host, date, url_with_method, status, size, referrer, agent = data
end
