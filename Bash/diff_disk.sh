#!/bin/bash
df -t nfs | perl -ane 'print "$F[3] $F[-2] $F[-1]\n"' > /tmp/df.1
sleep 60
df -t nfs | perl -ane 'print "$F[3] $F[-2] $F[-1]\n"' > /tmp/df.2
diff /tmp/df.{1,2}
