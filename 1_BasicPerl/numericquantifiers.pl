# numericquantifiers.pl
# Collin Abraham
# 2022-08-06
# script demonstrates using numeric quantifiers within regular expressions 

use strict;
use warnings;

$|=1;

sub main {
	
	# * zero or more of preceding char, greedy by default
	# + one or more of preceding char, greedy by default
	# *? zero or more of the preceding char, non-greedy by default 
	# +? one or more of preceding char, non-greedy by default
	
	my $text = 'DE75883';
	my $counter = 1;
	
	# manually match 5 chars after DE
	if ($text =~ /(DE.....)/) {
		print "Matched $counter: $1\n";
		++$counter;
	}
	
	# explicitly capture 5 digits after DE 
	if ($text =~ /(DE\d\d\d\d\d)/) {
		print "Matched $counter: $1\n";
		++$counter;
	}
	
	# matches 5 of the preceding character {5} 
	if ($text =~ /(DE\d{5})/) {
		print "Matched $counter: $1\n";
		++$counter;
	}
	
	# at least 3 and at most 6 
	if ($text =~ /(DE\d{3,6})/) {
		print "Matched $counter: $1\n";
		++$counter;
	}
	
	# match at least 3 then as many as possible in upper bound
	#  using \d{7,} would not match anything since there are 5 numbers 
	if ($text =~ /(DE\d{3,})/) {
		print "Matched $counter: $1\n";
		++$counter;
	}
}

main();