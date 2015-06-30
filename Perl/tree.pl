#!/home/y/bin/perl
use strict;
use warnings;
print "Please enter the names of trees you want to find out about...\n";
while ( my $tree = <STDIN> )
{
    chomp $tree;
    exit if $tree eq 'STOP';
    my $uses = uses( $tree );
    if ( $uses )
    {
        print "The products of $tree include $uses.\n";;
    }
    else
    {
        print "I don't have any information about this tree.\n";
    }
}
sub uses
{
    my $tree = shift;
    my %uses =
    (
        oak    => "wood, acorns",
        apple  => "apples, jam, juice",
        orange => "oranges, neroli oil",
        pine   => "pallet boards",
    );
    return $uses{ $tree };
}

