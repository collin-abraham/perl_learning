# joinviewdatadump.pl
# Collin Abraham	
# 2022-08-07
# demo of how to use join command within csv files and data dumper

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	my $input = 'test.csv';
	open(INPUT, $input) or die("Could not open $input.\n");
	
	# eat first line of csv, stored in $_ if needed 
	<INPUT>;
	
	# should be noted that Perl does not remove new line characters from lines that are read 
	while (my $line = <INPUT>) {
		my @values = split ',' , $line;
		
		# join together all the values of array with |
		#print join '|', @values;
		
		# dumps out an array into a string.. accepts an arbitrary data structure
		print Dumper(@values);
	}
	
	
	close(INPUT);
}

main();