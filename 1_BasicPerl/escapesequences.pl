# escape sequences.pl
# Collin Abraham
# 2022-08-05
# a script demostrating using escape sequences within regular expresssions 

use strict;
use warnings;

$|=1;

sub main {

	# all escape sequences match only one, must use a quantifier!
	# \d matches any single digit 
	# \s matches a space character
	# \S matches any non-space character
	# \w matches any alphanumeric, including underscore
	
	
	# to extract just the numeric part of this string:
	my $text = 'I am 117 years old tomorrow.';
	
	# =~ 'equals matches'
	# match at least one or more of the preceeding digit
	# if you run it as /(\d*)/ it matches nothing because it is technically 0 or more
	if($text =~ /(\d+)/) {
		print "Matched: '$1'\n";	
	}
	
	# y then any non-space char 1 or more ..
	if ($text =~ /(y\S+)/) {
		print "Matched: '$1'\n";
	}
	
	# match 'any space any' 
	if ($text =~ /(.\s.)/) {
		print "Matched: '$1'\n";
	}
}

main();