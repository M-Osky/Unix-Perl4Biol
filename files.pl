#!/usr/bin/perl
use strict; use warnings;
#files.pl

my $dirname = "D:/Dropbox/WORK/BIOINFORMATICS/UNIXyPERL/USB/Unix_and_Perl_course/mark/";

opendir(DIR, $dirname);
my @files = readdir(DIR);
closedir(DIR);

foreach my $file (@files) {
	next if($file =~ /^\.$/);
	next if($file =~ /^\.\.$/);
	print "\nFiles:\n\n$file \n";
	
	my $path = $dirname . $file;
	
	print "Path = $path\n\n";
	
	open(my $in, $path) or die "error openning $file for reading: $!";
	
	while (<$in>){
	
	my $info = $_;
	my @datacheck = split(//, $info);
	if ($datacheck[0] eq 0 || $datacheck[0] eq 1) { }
	else { print "$datacheck\t$info\n"; }
	}
}



print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;