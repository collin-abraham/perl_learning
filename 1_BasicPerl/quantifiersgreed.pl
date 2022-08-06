# quantifiersgreed.pl
# Collin Abraham
# 2022-08-05
# a script demostrating greedy vs non greed quantifiers 

use strict;
use warnings;

$|=1;

sub main {
	my $file = 'drac.txt';

	open(INPUT,$file) or die("Input file $file could not be opened.\n");

	while (my $line = <INPUT>) {
		
		# + will match one or more refers to a quantifier /(l+)/
		#if ($line =~ /(l+)/) {
		#	print "$1\n";
		#}
		
		# * returns 0 or more of the preceeding character son soon etc
		#if($line =~ /(so*n)/) {
		#	print "$1\n";
		#}
		
		# this will return lines like this: 
		# 's with offers to don'
		# starts with 's' and ends with 'n' ... zero or more between them 
		# the asteriks by iteself is greedy, so it will also pass by as many 'n' as possible such as:
		# 's and addresses.  Donations are accepted in a n'
		#if($line =~ /(s.*n)/) {
		#	print "$1\n";
		#}
		
		# the ? causes it to no longer be greedy.. 
		# will stop at the first instance of n in a sentence 
		if($line =~ /(s.*?n)/) {
			print "$1\n";
		}
	}
	
	close(INPUT);
}

main();