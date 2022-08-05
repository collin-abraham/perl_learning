use strict;
use warnings;

$|=1;

sub main {
	
	
	my $output = 'output.txt';
	my $input = 'drac.txt';
	
	open(INPUT, $input) or die("Could not open $input.\n");
	
	# the > at the start of filename suggests that it is being written out
	# the .  concatenates the > to the string of the filename
	# alternatively you could have done my $output = '>output.txt';
	open(OUTPUT, '>'.$output) or die("Could not write to $output.\n");
	
	# \b in the regex will create a "word boundary" so that there can be anything on either side of the boundary 
	while (my $line = <INPUT>) {
		
		# must have s/ at the start to explain you are replacing 
		# relaces yes with YES
		# i at the end means case insensitive
		# g at the end means gloabl, otherwise it will only replace 1st occurence 
		if ($line =~ /\byes\b/) {
			$line =~ s/yes/YES/ig ;
			print OUTPUT $line;
		}
	}
	
	
	# explains to print that you print to that file instead 
	# print OUTPUT "Hello\n";
	
	close (INPUT);
	close (OUTPUT);
}

main();