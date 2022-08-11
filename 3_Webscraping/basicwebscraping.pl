# basicwebscraping.pl
# Collin Abraham
# 2022-08-11
# basics of web scraping 

use strict;
use warnings;

use LWP::Simple; # rip html from websites

$|=1;

sub main {
	my $content = get("http://www.caveofprogramming.com");
	
	# defined checks if the variable has been checked to a value 
	unless(defined($content)) {
		die "Unreachable URL\n";
	}
	
	# to tell Perl that your match here is a regular expression, surround it in single quotes and put 'm' at the start.. otherwise slashes and whatnot can really mess with the usage of regex 
	# 'i' makes it case insensitive
	if ($content =~ m'<meta property=".+?" content="(.+?)" />'i) {
		my $contents = $1;
		
		print "Contents: $contents\n";
	}
	else {
		print "\nContents not found!\n";
	}
}

main();