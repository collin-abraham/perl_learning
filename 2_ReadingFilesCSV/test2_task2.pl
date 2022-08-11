# test2_task2.pl
# Collin Abraham	
# 2022-08-11
# second test second task -> total up all the payment data 

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
		my $input = "wrongdata2.csv";
		open(INPUT, $input) or die("Could not open $input.\n");
		<INPUT>;
		
		my @data; 
		my $paymentTotal; 
		
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
			
			$paymentTotal += $payment;
		}
		
		close(INPUT);
		
		print "\n---All data: ---\n";
		foreach my $data(@data) {
			print "$data->{'Name'} $data->{'Payment'} $data->{'Date'} \n"; 
		}
		
		print "\nTotal payment: $paymentTotal\n";
}

main();