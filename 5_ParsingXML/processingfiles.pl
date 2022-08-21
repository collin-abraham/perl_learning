# processingfiles.pl
# Collin Abraham
# 2022-08-21
# demo showing how to grab files in a directory and filter the results with grep

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
	
usage: perl multilinestrings.pl -d <directory>

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

sub process_files {
	#my @files = shift;
	#my $input_dir = shift;

	my ($files,$input_dir) = @_;
	
	print "Checking directory: $input_dir\n";
	print Dumper($files); # display what was passed
	
	foreach my $file(@$files) {	# you can cast a reference to an array so it works in foreaech
		process_single_file($file, $input_dir);
	}
}

sub process_single_file {
	my ($file, $input_dir) = @_;
	print "Processing $file in $input_dir ... \n";
}


sub main {		
	my %options; 
	getopts('rd:',\%options); 

	if (!checkusage(\%options)) {
		usage();
	}
	
	my $input_dir = $options{"d"};
	my @files = get_files($input_dir);
	
	process_files(\@files, $input_dir); # send a ref to the array
	

}


main();