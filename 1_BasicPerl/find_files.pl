use strict;
use warnings;

# turns off output buffering 
$| = 1;

sub main {
	
	# arrays start with an @ sign
	my @files = (
		'd:\code\perl\1_basicperl\logo.png', 
		'd:\code\perl\1_basicperl\lwp_simple.pl',
		'd:\code\perl\1_basicperl\missing.txt',
	);
	
	# to iterate over an array
	# set $file to each element of @files
	foreach my $file (@files) {
		
		# -f means "check if this file exists or not"
		if (-f $file) {
			print "Found file: $file\n";
		}
		else {
			print "File not found: $file\n";
		}
	}
	
	# assign the file path directly to a var
	# my $file = 'd:\code\perl\1_basicperl\logo.png';
	
	
	
}

main();