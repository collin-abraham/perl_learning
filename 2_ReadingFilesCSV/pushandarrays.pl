# removingspacesfromsplits.pl
# Collin Abraham	
# 2022-08-08
# demo of populating arrays manually with [] and push() 

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
	
	#my $count = 0;
	
	while (my $line = <INPUT>) {
		
		chomp $line;
		
		my @values = split /\s*,\s*/ , $line;
		
		push @lines, $lines; # as if it were a stack .push()
		
		# you could push the lines into the array by using a counter and idx push them
		#$lines[$count] = $line;
		#$count++;
	}
	
	# display contents of @lines 
	foreach my $line(@lines) {
		print $line . "\n";
	}
	
	close(INPUT);
}

main();