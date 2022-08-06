# test1_task2.pl
# Collin Abraham
# 2022-08-06
# testing knowledge of course thus far 

use strict;
use warnings;

$|=1;

# task 2
# write a regex that can pick out machine codes from this text
# a machine code definition: 2 alpha num -> 4 digits
# display the code by itself, else say not found

sub main {
	my $text = "The code for this device is GP8765";
	
	if ($text =~ /(\w{2}\d{4})/) {
		print "Valid machine code: $1\n";
	}
	else {
		print "Invalid machine code: $1\n";
	}
}

main();