# matchingrepeatedly.pl
# Collin Abraham
# 2022-08-13
# web scraping by matching many times over 

use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main {
	my $content = get("http://www.caveofprogramming.com");
	 
	unless(defined($content)) {	die "Unreachable URL\n"; }
	
	# --- how to rip multiple links from the site
	# we are using | | to contain so that we can push qutoes in the regex
	# m for matches 
	# g for global, do it repeatedly 
	# i for case insensitive
	# s for treat newlines as another char in the regex
	# x for allow newlines and comments in the regular expression
	while ($content =~ 
	m|<\s*a\s+[^>]*          # match: <a 
	href\s*=\s*['"]          # match: href="
	([^>"']+)['"]            # match: URL between " "
	[^>]*>\s*([^<>]*)\s*</   # match: >URL Title</
	|sigx) { 
		print "$2: $1\n";
	}
}

main();