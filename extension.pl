#!/usr/bin/perl
use strict; use warnings;
#extension.pl

#Quick script to change the filename or file extension

my $dirname = "D:/Dropbox/MOSKY/CURRO/BIOINFORMATICS/UNIXyPERL/USB/Unix_and_Perl_course/mark";

opendir(DIR, $dirname);
my @files = readdir(DIR);
closedir(DIR);

foreach my $file (@files) {
	next if($file =~ /^\.$/);
	next if($file =~ /^\.\.$/);

	my $path = $dirname . "/". $file;
	open(my $in, $path) or die "error openning $file for reading: $!";
	
	my $newname = $file;
	$newname =~ s/\.txt//;
	my $outpath = $dirname . "/". $newname;
	
	open my $out, '>', "mark/$newname" or die "Cannot create $newname: $!";
	
	use File::Copy qw(move);
	move $in, $out;

	
	# SAVE FILE
	
	
	# Loop over the array
	#foreach ($in) {print $out "$_\n";} # Print each entry in our array to the file
	close $in;
	close $out; 

	print "\nFile $file succesfully renamed as $newname!\n\n";

}








print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;