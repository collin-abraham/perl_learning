# iteroverhashes.pl
# Collin Abraham	
# 2022-08-09
# demo for iteration over hashes

use strict;
use warnings;

use Data::Dumper;

$|=1;



sub main {
	my %foods = (
		"mice" => "cheese",
		"dogs" => "meat",
		"birds" => "seeds"
	);
	
	# hypothetically.. we can define an array of variables as:
	my ($one,$two,$three) = (1,2,3);
	print "Implicit array call to \$two: $two\n\n";
	
	while (my ($key,$value) = each %foods) {
		print "$key: $value\n";
	}
	
	print "\n";
	my @animals = keys %foods;
	print Dumper(@animals);
	print "\n";
	
	# iter over the hash by keys 
	foreach my $key(@animals) {
		my $value = $foods{$key};
		print "$key = $value\n";
	}
	
	print "\n\nIter by sorting:\n";
	foreach my $key (sort keys %foods) {
		my $value = $foods{$key};
		print "$key = $value\n";
	}
	
	
	
	
	
}

main();