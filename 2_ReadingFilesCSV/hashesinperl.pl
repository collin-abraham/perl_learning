# hashesinperl.pl
# Collin Abraham	
# 2022-08-09
# demo all about using hashes

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	# in perl, hashes have no order unlike std::map<T>
	# the quotes around the keys are optional, but best practice
	my %months = (	# () init for arrays/hashes
		"Jan" => 1,
		"Feb" => 2,
		"Mar" => 3,
		"Apr" => 4,
		"May" => 5,
		"Jun" => 6,
	); 
	
	# to access values of a hash
	print $months {"Feb"} . "\n";
	
	# keys can also be numbers
	# the values can also be arrays, which is common in perl 
	my %days = (
		1 => "Sunday",
		2 => "Monday", 
		3 => "Tuesday",
		4 => "Wednesday",
	);
	
	print $days{1} . "\n\n";
	
	# how to iterate over a hash
	# allowed to have %months and @months .. no collision
	my @months = keys %months;
	foreach my $month(@months) {
		my $value = $months { $month };
		print "Value: $value\n";
	}
	
	print "\n\nIter over a hash's key/value pairs:\n";
	# how to pull key and value 
	# each() returns a small array, which we can push 
	while(my ($key,$value) = each %days) {
		print "$key: $value\n";
	}
}

main();