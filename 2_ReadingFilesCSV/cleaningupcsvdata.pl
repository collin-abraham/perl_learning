# cleaningupcsvdata.pl
# Collin Abraham	
# 2022-08-11
# demo for how to clean up data in a csv file

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
			
			# if we have a bunch of space at start or end of line 
			# ^ matches the start of the line
			# if there is 0 or more space, replace it with null instead
			#$line =~ s/^\s*//;
			
			# $ anchors it to end of the line 
			# same logic, find space at end of line, replace with null
			#$line =~ s/\s*$//;
			
			# both previous expressions can be combined with a | 
			# as an OR operator 
			# we have to do a global match (g)
			# g makes it do the regex over and over again, as many times as is necessary 
			$line =~ s/^\s*|\s*$//g;
			
			# get rid of "?"
			# get rid of "approx."
			# get rid of "$"
			$line =~ s/\?|approx\.|\$//g;

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