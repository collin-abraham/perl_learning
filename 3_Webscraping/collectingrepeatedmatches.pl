# collectingrepeatedmatches.pl
# Collin Abraham
# 2022-08-13
# how to collect repeated matches

use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main {
	my $content = get("http://www.caveofprogramming.com");
	 
	unless(defined($content)) {	die "Unreachable URL\n"; }
	
	# lets try to match all CSS classes 
	my @classes = $content =~ m|class="([^"']*?)"|ig;
	
	# using array in a scalar context returns number of items in the array
	# similar to just asking if array.empty()
	if (@classes == 0) {
		print "No matches!\n";
	}
	else {
		foreach my $class(@classes) {
			print "$class\n";
		}
	}
}

main();