netstat -an | awk '/^tcp/ {A[$(NF)]++} END {for (I in A) {printf "%8d %s\n", A[I], I}}' 

