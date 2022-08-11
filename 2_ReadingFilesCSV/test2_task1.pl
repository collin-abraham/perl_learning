# test2_task1.pl
# Collin Abraham	
# 2022-08-11
# second test first task -> use the csv file with the bad data 
# create a perl program that outputs all of the data in the csv 

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
		my $input = "wrongdata2.csv";
		open(INPUT, $input) or die("Could not open $input.\n");
		<INPUT>;
		
		my @data; 
		
		LINE: while(my $line = <INPUT>) {
			
			# wipe out spaces at start and end 
			$line =~ s/^\s*|\s*$//g;
			
			# wipe out "?", "approx.", "$"
			$line =~ s/\?|approx\.|\$//g;

			# if the line is all spaces, skip
			$line =~ /\S+/ or next; 
			
			chomp $line; 
			
			my @values = split (/\s*,\s*/, $line);
			
			if(scalar(@values) < 3) {
				print "Invalid line: $line\n";
				next; 
			}
			
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
		
		print "\n---All data: ---\n";
		foreach my $data(@data) {
			print "$data->{'Name'} $data->{'Payment'} $data->{'Date'} \n"; 
		}
}

main();