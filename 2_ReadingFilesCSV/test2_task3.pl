# test2_task3.pl
# Collin Abraham	
# 2022-08-11
# second test second task -> extract the column names from the heading, don't use $name $payment $date 

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
		my $input = "wrongdata2.csv";
		open(INPUT, $input) or die("Could not open $input.\n");
		
		# extract col names
		my $colNames = <INPUT>;
		chomp $colNames;
		my @colNames = split (/\s*,\s*/, $colNames);
		
		my @data; 
		my $paymentTotal = 0; 
		
		LINE: while(my $line = <INPUT>) {
			chomp $line; 
			
			$line =~ s/^\s*|\s*$//g;
			$line =~ s/\?|approx\.|\$//g;
			$line =~ /\S+/ or next; 
			

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
			
			# hash of the line 
			my %valuesHash;
			
			# populate the hash with keys extracted from the column names above 
			
			for(my $i = 0; $i < @colNames; $i++) {
				my $heading = $colNames[$i];
				my $value = $values[$i];
				$valuesHash{$heading} = $value;
				
				# when we encounter the Payment heading, increment the total counter
				if ($heading eq "Payment") {
					$paymentTotal += $value; 
				}
			}
			
			push @data, \%valuesHash;
		}
		
		# print out all contents 
		print "\n---All data: ---\n";
		for (my $i = 0; $i < @data; $i++) {
			for (my $x = 0; $x < @colNames; $x++) {
				print "$data[$i]{$colNames[$x]} ";
			}
			print "\n";
		}
		
		
		print "\nTotal payment: $paymentTotal\n";
}
		

		



main();