# test1_task3.pl
# Collin Abraham
# 2022-08-06
# testing knowledge of course thus far 

use strict;
use warnings;

$|=1;

# task 3
# write a regular expression that extracts the code after is and before the period

sub main {
	my $text = "The code for this device is GP8765.";
	
	if ($text =~ /is\s(\w{2}\d{4})\./) {
		print "Valid machine code: $1\n";
	}
	else {
		print "Invalid machine code: $1\n";
	}
}

main();