def started
     Time.now - IO.read('/proc/uptime').split[0].to_i
end
