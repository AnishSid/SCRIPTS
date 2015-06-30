 #!/usr/local/bin/perl
     require 'open2.pl';

     $MAILTO = "root";

     $pid = &open2("OUTPUT","INPUT","/usr/local/bin/fping -u");

     @check=("slapshot","foo","foobar");

     foreach(@check) {	print INPUT "$_\n"; }
     close(INPUT);
     @output=;

     if	($#output != -1) {
      chop($date=`date`);
      open(MAIL,"|mail -s 'unreachable systems'	$MAILTO");
      print MAIL "\nThe	following systems are unreachable as of: $date\n\n";
      print MAIL @output;
      close MAIL;
     }

