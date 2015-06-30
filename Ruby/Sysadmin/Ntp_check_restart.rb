#DUMP NTP restart on RHEL
#!/usr/bin/env ruby

def ntp_checker
        ntpcheck=Array.new
        ntpcheck=`ps auxwww | grep -i ntp | egrep -v 'grep|root'`
        return ntpcheck
end


def rhel_restart
        start=`sudo /etc/init.d/ntpd start`
        return start
end


if `uname -s -r` =~ /Linux/i
        ntp_checker
        if ntp_checker !~ /ntpd/i
        rhel_restart
        puts "NTP wasnt running and is being started now"
        else puts "NTP is running fine\n"
        end
end

puts "Process Check : #{ntp_checker}"
