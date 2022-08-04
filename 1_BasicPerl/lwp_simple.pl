use strict;   #forces keyword  "my" before variable declarations 
use warnings;

use LWP::Simple; #allows pulling media from websites

sub main() {
	print "Downloading ...\n";
	
	# print out the html file pulled from first arg
	#print get("https://www.google.ca/");
	
	# store the html file of the first arg to the file in the second arg 
	#getstore("https://www.google.ca","home.html");
	
	#getstore() returns a returncode to see if was successful
	#this pullls the main google logo from google.ca and stores to the second arg 
	my $code  = getstore("https://www.google.ca/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png", "googlepicture.png");
	
	if ($code == 200) {
		print "Success!\n";
	}
	else {
		print "Failed!\n";
	}
	
	print "Finished!\n";
}
	
main();