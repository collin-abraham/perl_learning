# gettingcmdlineoptions.pl
# Collin Abraham
# 2022-08-14
# demo of how to get command line options in a program
# run from the command line as:
# perl gettingcmdlineoptions.pl -a -f file.xml -c

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std; # will fill a hash with cmd args 

$|=1;

sub main {
	print "Direct call to argv[0]: $ARGV[0]\n\n"; # can access ARGV as an array	
	
	my %options; # init hash
	getopts('af:c',\%options); # a, f and c are all flags.. f takes another opt
	
	print Dumper(%options);
	
	my $file = $options{'f'};
	print "File: $file\n";
	
	

}


main();