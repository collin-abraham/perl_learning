# subroutines.pl
# Collin Abraham
# 2022-08-14
# demo of using subroutines and returning values 

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

sub usage {
	
}

sub checkusage {
	
}

sub main {		
	my %options; 
	getopts('af:c',\%options); 
	
	if (!checkusage()) {
		usage();
	}
}


main();