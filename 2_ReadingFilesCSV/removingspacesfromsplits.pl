# removingspacesfromsplits.pl
# Collin Abraham	
# 2022-08-08
# demo of how to remove spaces from csv splits 
# uses chomp()

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	my $input = 'test.csv';
	open(INPUT, $input) or die("Could not open $input.\n");
	
	# consume first line of read in 
	<INPUT>;
	
	while (my $line = <INPUT>) {
		
		# by default, it removes trailing record seperator chars
		# will remove the newline from the end of the line
		chomp $line;
		
		print "'$line'\n";
		
		# now we can split on a regular expression
		# 0 or more spaces, comma, 0 or more spaces 
		my @values = split /\s*,\s*/ , $line;
		
		print Dumper(@values);
	}
	
	
	close(INPUT);
}

main();