# regexwildcards.pl
# Collin Abraham
# 2022-08-05
# this script opens a file drac.txt, uses regex wildcards to find a string and then print it to the screen 

use strict;
use warnings;

$|=1;

sub main {
	my $file = 'drac.txt';

	open(INPUT,$file) or die("Input file $file could not be opened.\n");

	while (my $line = <INPUT>) {
		# the . denotes ANY character around the y and s 
		if ($line =~ /y.s/) {
			print $line;
		}
	}
	
	close(INPUT);
}

main();