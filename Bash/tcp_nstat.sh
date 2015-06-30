while true; do  echo "*******"; sleep 2; netstat -an | grep ESTA | awk '{ if ( !/127.0.0.1/) { if ( ($3 > 16384 ) ) {count++; snd +=  $3; print $0; } } } END {printf ("Cnt=%d Snd: %d\n", count, snd);}'; done

