# multilinestrings.pl
# Collin Abraham
# 2022-08-15
# demo of using multi line comments and strings 

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;


=pod
	This is a multiline comment
	Use with care
	pod = "plain old documentation"
=cut


# multi line strings start with <<NAME;
# must end with NAME at the start of the line you ended on
# could also just print the string directly
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
	return 0;
}

sub main {		
	my %options; 
	getopts('af:c',\%options); 
	
	if (!checkusage()) {
		usage();
	}
}


main();