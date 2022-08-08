# arraysofarrays.pl
# Collin Abraham	
# 2022-08-08
# demo of creating arrays of arrays
# arrays of arrays are actually.. arrays of references to other arrays 

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	my $input = 'test.csv';
	open(INPUT, $input) or die("Could not open $input.\n");
	
	<INPUT>;
	
	# array to store the lines
	my @lines;
	
	while (my $line = <INPUT>) {
		
		chomp $line;
		
		my @values = split /\s*,\s*/ , $line;
		
		# \@values says push a reference to @values 
		push @lines, \@values; 
		
	}
	
	# prints first value of first reference 
	print "Direct call to a reference: ";
	print $lines[0][0] . "\n\n";
	
	# to extract just the first value of each ref, for instance
	print "For each call to ref: ";
	foreach my $line(@lines) {
		print "Name " . $line->[0] . "\n";
	}
	
	close(INPUT);
}

main();