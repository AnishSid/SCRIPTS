pipe = IO.popen("netstat -an | awk '/^tcp/ {A[$(NF)]++} END {for (I in A) {printf "%8d %s\n", A[I], I}}'")
#pipe = IO.popen("netstat 3")
while (line = pipe.gets)
    print line
      print "and"
end
