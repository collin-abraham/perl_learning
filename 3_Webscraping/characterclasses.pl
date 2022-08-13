# characterclasses.pl
# Collin Abraham
# 2022-08-13
# how to use character classes in regex 

use strict;
use warnings;

$|=1;

sub main {
	my $content = "The 39 Steps is GREAT! Colors_15 ==%== ABCBABCCBABCABC";
	
	
	# character classes are surrounded in [ ]
	if ($content =~ /([0-9]+)/) { # any character between 0 and 9 
		print "Matched '$1'\n";
	}
	else {
		print "No match\n";
	}
	
	if ($content =~ /([A-Z]{2,}+)/) { # match uppercase, at least 2
		print "Matched '$1'\n";
	}
	else {
		print "No match\n";
	}
	
	# Start with C then A-Z, a-z, underscore and 0-9
	if ($content =~ /(C[A-Za-z_0-9]{2,}+)/) { 
		print "Matched '$1'\n";
	}
	else {
		print "No match\n";
	}
	
	# you can backslash any character that might have a special
	# func in regular expressions 
	if ($content =~ /([=%]{2,}+)/) { 
		print "Matched '$1'\n";
	}
	else {
		print "No match\n";
	}
	
	# to match a bunch of random chars you know their approx contents 
	if ($content =~ /([ABC]{3,}+)/) {
		print "Matched '$1'\n";
	}
	else {
		print "No match\n";
	}
	
	# to match any char EXCEPT what follows in the square brackets  
	if ($content =~ /([^0-9T\s]{5,}+)/) {
		print "Matched '$1'\n";
	}
	else {
		print "No match\n";
	}
}

main();