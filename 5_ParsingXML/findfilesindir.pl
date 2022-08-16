# findfilesindir.pl
# Collin Abraham
# 2022-08-15
# finding files/folders in a directory and filtering through arrays 

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;

$|=1;

# display a list of files in a directory the user specifies 
sub get_files {
	my $input_dir = shift; # rips first entry from @_
	
	# one method of pulling files from a directory
	unless(opendir(DIR, $input_dir)) {
		die "Unable to open directory $input_dir\n";
	}
		
	my @files = readdir(DIR); # one way to pull files in a directory
	closedir(DIR);
	
	# 1st arg is regex, 2nd arg is the array to filer  
	# returns an array that matches the regex statement in arg 1
	@files = grep(/\.xml$/,@files); 
	return @files;
	
}

# help menu for users 
sub usage {
	print <<USAGE;
	
usage: perl multilinestrings.pl -f <filename>
	-d <directory>
	-r run the program and process the files 
USAGE
}

# confirm option flags were correct
sub checkusage {
	my $opts = shift;
	
	my $r = $opts->{"r"};
	my $d = $opts->{"d"};
	
	unless (defined($d)) {
		return 0;
	}
	
	return 1;
}


sub main {		
	my %options; 
	getopts('rd:',\%options); 

	if (!checkusage(\%options)) {
		usage();
	}
	
	my $input_dir = $options{"d"};
	my @files = get_files($input_dir);
	print Dumper(\@files);
}


main();