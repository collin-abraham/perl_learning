# validationcsv.pl
# Collin Abraham	
# 2022-08-10
# demo for validating data in a csv file 

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
		my $input = "wrongdata.csv";
		open(INPUT, $input) or die("Could not open $input.\n");
		<INPUT>;
		
		my @data; # array to store hashes
		
		
		# label the main loop
		LINE: while(my $line = <INPUT>) {
			
			# check that there is actually something in the nextline
			$line =~ /\S+/ or next; 
			
			chomp $line; # eat the newline at end 
			
			# you can implicitly create 3 variables 
			my @values = split (/\s*,\s*/, $line);
			
			# have a look at the array and make sure it ripped 3 things 
			# forces the array to be a scalar 
			if(scalar(@values) < 3) {
				print "Invalid line: $line\n";
				next; 
			}
			
			# iterate through the values, make sure they're not empty
			# comparing strings uses eq 
			for my $value(@values) {
				if ($value eq '') {
					print "Invalid line: $line\n";
					next LINE;
				}
			}
			
			my ($name, $payment, $date) = @values; 
			
			my %values = (
				"Name" => $name,
				"Payment" => $payment,
				"Date" => $date,
			);
			
			push @data, \%values;
		}
		
		close(INPUT);
		
		foreach my $data(@data) {
			print $data->{"Payment"} . "\n"; 
		}
		
		print "Solo call to name: " . $data[0]{"Name"};
}

main();