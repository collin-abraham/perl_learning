# usingxmlsimple.pl
# Collin Abraham
# 2022-08-22
# setting global seperator to undefined gives the ability to read in the whole file as a solid string. This string can then be passed as an argument to an XML::Simple object (which lives inside of a regular $. 
# we use a document object model to contain the parsed data, and it then contains a reference to a hash .. can be called as $dom->{"key"};

use strict;
use warnings;

use Data::Dumper;
use Getopt::Std;
use XML::Simple;

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
	
	#my $r = $opts->{"r"};
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
	#print Dumper($files); # display what was passed
	
	foreach my $file(@$files) {	# you can cast a reference to an array so it works in foreaech
		process_single_file($file, $input_dir);
	}
}

sub process_single_file {
	my ($file, $input_dir) = @_;
	print "Processing $file in $input_dir\n";
	
	my $file_path = "$input_dir/$file";
	open(INPUT,$file_path) or die "Unable to open $file_path\n";
	
	undef $/; # record seperator can be set to an undefined value
	
	my $content = <INPUT>;
	
	close(INPUT);
	
	print $content; 
	
	# this is referred to a "blessed" hash by Larry Wall... 
	my $parser = new XML::Simple; # in Perl, objects are just glorified hashes (syntax)
	
	my $dom = $parser->XMLin($content); # dom = document object model
	
	
	# maybe we want to get an array of all the bandnames
	print Dumper($dom->{"entry"}); # this is a reference to an array
	
	foreach my $band(@{$dom->{"entry"}}) {	# must cast the reference to an actual array @$
		print Dumper($band->{"band"});
	}
	
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