# test1_task1.pl
# Collin Abraham
# 2022-08-06
# testing knowledge of course thus far 

use strict;
use warnings;

$|=1;

# task 1
# create an array of email addresses, some of them should be valid
# create at least 1 email address that is invalid
# loop through the array and display each email address
# at least 1 alpha numeric -> @ sign -> atleast 1 alpha numeric -> . char -> at least 1 alpha numeric

sub main {
	my @emails = (
	'bob@billy.com',
	'sally@sue.com',
	'jenn@jay.com',
	'in#valid.com'
	);
	
	foreach my $address (@emails) {
		print "Addr: $address ->";
		
		if ($address =~ /(\w+?@\w+?\.\w+)/ ) {
			print " valid address!";
		}
		else {
			print " invalid address!";
		}
		
		print "\n";
	}
}

main();