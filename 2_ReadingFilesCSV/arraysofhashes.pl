# arraysofhashes.pl
# Collin Abraham	
# 2022-08-09
# demo for using arrays of hashes

use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	
	my %hash1 = (
		"cat" => "meat",
		"birds" => "seeds",
		"fish" => "worms"
	);
	
	my @test;
	
	# how do we put %hash1 into @test?
	# we can use push, but that just pushes all the data into 6 elements
	#push @test, %hash1;
	
	# instead take a ref to the hash in the push
	push @test, \%hash1;
	
	# what's inside? we can call the key directly
	print $test[0]{"birds"} . "\n";
	
	# manually sets element 1 to hash1
	$test[1] = \%hash1;
	print $test[1]{"fish"} . "\n";
	
}

main();