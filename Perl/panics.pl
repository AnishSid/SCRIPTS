#!/home/y/bin/perl
use strict;

my (@vxs_list,@list1,$content,$link,@tmp,$farm_list, $host, @list, @farm_list, @delivery_list, @vespa_list, @misc_list);

#getting the hostlist from panics.corp.company.com scrap your panics page and email required teams for their host panics

#Different kinds of nodes
@list= `lynx -dump http://panics.corp.company.com | grep hostname`; 
map {
	@tmp = split /=/, $_;
	$host = $tmp[$#tmp];
	chomp $host;
	if (($host =~ /qmail\.company\.com/)||($host =~ /qmail\.[-a-zA-Z0-9]{1,}\.company.com/))
	{
		if(($host =~ /^web/) || ($host =~ /^mix/) || ($host =~ /^pcm/) || ($host =~ /^gsproxy/)) 
		{ 
			push @farm_list, $host; 
		}
		elsif (($host =~ /^mta/) || ($host =~ /^smtp/) || ($host =~ /^pop/))
		{
			push @delivery_list, $host;
		}
		elsif ($host =~ /vespa/) 
		{
			push @vespa_list, $host;
		}
		elsif ($host =~ /vxs/)
                {
			push @farm_list, $host;
                }
		else { push @misc_list, $host; }
	}
} @list;

@list1=(@farm_list,@delivery_list,@vespa_list,@misc_list);


   my $filename = "/tmp/alertfile"; 
   my $qmailto = "product-alerts\@company.com";
   my $qmailfrom = "product-oncall\@company.com";
   my $link = "http://wiki.corp.company.com/view/productPanicsMonitor";

   open ALERT, ">$filename" ;
   print ALERT "From: $qmailfrom\n" ;
   print ALERT "To: $qmailto\n" ;
   print ALERT "SUBJECT: Host Panicked\n" ;
   print ALERT "HOST: Multiple\n";
   print ALERT "CLUSTER: Multiple\n";
   print ALERT "COLO: mul\n";
   print ALERT "COMPONENT: Yqmail Oncall\n";
   print ALERT "SEVERITY: 5\n";
   print ALERT "ALERT-TYPE: Host_Panic\n";
   print ALERT "ERROR_MSG: Host Panicked - Refer $link\n";

   print ALERT "\nWebFE, Mix, Pcm, Gsproxy hosts: \n"; 

   if (@farm_list) {
      $content = join("\n" , @farm_list);
      print ALERT "$content\n";
   } else {print ALERT "None\n";}

   print ALERT "\nDelivery hosts: \n";
   if (@delivery_list) {
      $content = join("\n" , @delivery_list);
      print ALERT "$content\n";
   } else {print ALERT "None\n";}

   print ALERT "\nVespa hosts: \n";
   if (@vespa_list) {
      $content = join("\n" , @vespa_list);
      print ALERT "$content\n";
   } else {print ALERT "None\n";}

   print ALERT "\nVX Hosts: \n";
   if (@vxs_list) {
      $content = join("\n" ,@vxs_list);
      print ALERT "$content\n";
   } else {print ALERT "None\n";}
   print ALERT "\n$link\n";

   close ALERT ;

   if ( @farm_list || @delivery_list || @vespa_list || @vxs_list ) {
   system("/usr/sbin/sendqmail $qmailto < $filename");
#   system("/usr/sbin/sendqmail page-product-oncall\@company-inc.com < $filename");
   }
