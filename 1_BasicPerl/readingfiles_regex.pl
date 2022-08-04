use strict;
use warnings;

$|=1;

sub  main {
	#filepath
	my $file = '.\drac.txt';
	
	# open a file and INPUT is the handler .. if not complete program will die 
	open(INPUT,$file) or die("Input file $file not found");
	
		# reads one line from the file into $line
	# will print out each line from the file 
	#while(my $line = <INPUT>) { 
	#	print "$line";	#}
	
	# if in the line and we regex match with "gut" print the line 
	while (my $line = <INPUT>) {
		if ($line =~ /gut/) {
			print $line;
		}
	}
		

	#forces program to quit, and gives the line number	#die "Input file $file not found.\n";	
	close(INPUT);
}

main();	