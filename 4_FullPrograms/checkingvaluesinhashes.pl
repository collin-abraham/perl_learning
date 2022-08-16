# checkingvaluesinhashes.pl
# Collin Abraham
# 2022-08-15
# checking the values inside of a hash.. for checking cmd line options here 

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

sub usage {
	my $help = <<USAGE;
	
usage: perl multilinestrings.pl -f <filename>
	-f <filename>	specify XML filename to parse
	-a	turn off error checking (optional)
	-c	mandatory flag
USAGE

	print $help;
	exit(); 

}

sub checkusage {
	my $opts = shift;
	
	# pull values out, check if they are defined
	# a is optional, not absolutely necessary
	# c is mandatory
	# f is mandatory (filename)
	
	my $c = $opts->{"c"};
	my $f = $opts->{"f"};
	
	unless (defined($c) and defined($f)) {
		return 0;
	}
	
	unless ($f =~ /\.xml$/i) {
		print "File must have extension .xml\n";
		return 0;
	}
	

	return 1;
}


sub main {		
	my %options; 
	getopts('af:c',\%options); 

	if (!checkusage(\%options)) {
		usage();
	}

}


main();