use strict;
use warnings;

$|=1;

sub main {
	my $input = 'test.csv';
	
	open(INPUT, $input) or die("Could not open $input.\n");
	
	# another alternate way to open files 
	#unless(open(INPUT, $input)) {
	#	die "\nCannot open $input\n";
	#}

	# this continuously will read in the file 
	# if you don't specify anything, it ends up in a variable
	# called $_ ... thus you can just say print $_; to rip all the lines out quickly 
	#while(<INPUT>) {
	#	print $_;
	#}
	
	# this will read off the header and store it into $_
	# this strips away the top header with column names
	<INPUT>;
	
	# cleaner to declare simply my $line 
	# values is declared as an array @values, but when called later
	# it is used a scalar $values
	while (my $line = <INPUT>) {
		my @values = split ',' , $line;
		print $values[0] . "\n"; 
	}
	
	
	close(INPUT);
}

main();