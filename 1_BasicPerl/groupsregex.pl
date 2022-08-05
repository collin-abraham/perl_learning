# groupsregex.pl
# Collin Abraham
# 2022-08-05
# a script demostrating how to use and call regex groups 

use strict;
use warnings;

$|=1;

sub main {
	my $file = 'drac.txt';

	open(INPUT,$file) or die("Input file $file could not be opened.\n");

	while (my $line = <INPUT>) {
		
		#  the round brackets create a regex group 
		# $1 calls the first regex group, $2 calls the second regex group
		if ($line =~ /(I..a.)(...)/) {
			print "First match: $1; Second match: $2\n";
		}
	}
	
	close(INPUT);
}

main();