# referencestohashes.pl
# Collin Abraham
# 2022-08-15
# demo of passing hashes to subroutines by reference 

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

sub usage {
	my $help = <<USAGE;
	
usage: perl multilinestrings.pl -f <filename>
	-f <filename>	specify XML filename to parse
	-a	turn off error checking 
	-c	some other option of the program	
USAGE

	print $help;
	exit(); # kills the program 

}

sub checkusage {
	
	# access values by reference 
	my $opts = shift;
	print $opts->{"f"} . "\n";
	print $opts->{"a"} . "\n";
	
	return 0;
}


sub main {		
	my %options; 
	getopts('af:c',\%options); 
	
	# you can create a direct scalar reference to a hash
	my $options_ref = \%options;

	if (!checkusage(\%options)) {
		usage();
	}

}


main();