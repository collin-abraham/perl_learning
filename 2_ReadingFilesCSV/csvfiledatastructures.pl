# csvfiledatastructures.pl
# Collin Abraham	
# 2022-08-09
# demo for storing CSV data inside of perl data structures

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
		my $input = "test.csv";
		open(INPUT, $input) or die("Could not open $input.\n");
		<INPUT>;
		

		my @data; # array to store hashes
		
		while(my $line = <INPUT>) {
			chomp $line; # eat the newline at end 
			
			# you can implicitly create 3 variables 
			my ($name,$payment,$date) = split (/\s*,\s*/, $line);
			
			my %values = (
				"Name" => $name,
				"Payment" => $payment,
				"Date" => $date,
			);
			
			push @data, \%values;
		}
		
		close(INPUT);
		
		foreach my $data(@data) {
			print $data->{"Payment"} . "\n"; #must dereference with ->
		}
		
		# can call a hash's key directly too
		print "\n3rd entry's name: " . $data[3]{"Name"};
}

main();