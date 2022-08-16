# passingargs.pl
# Collin Abraham
# 2022-08-15
# demo of passing arguments to subroutines 

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

# option 1: pull scalars out of the array of args
sub checkusage {
	#arguments are stored in an internal array @_
	
	my ($greeting, $index)  = @_;
	print "$greeting: #$index\n";
	
	return 0;
}

# option 2: shift() automatically uses @_
sub checkusage2 {
	
	my $greeting = shift;
	my $index = shift;
	
	print "$greeting: #$index\n";
}

sub main {		
	my %options; 
	getopts('af:c',\%options); 

	checkusage("Hello there!",10)
	checkusage2("Howdy!",15);
	
	#if (!checkusage("Hello there!",10)) {
	#	usage();
	#}
}


main();