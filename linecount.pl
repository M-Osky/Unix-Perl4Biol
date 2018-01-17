#!/usr/bin/perl
use strict; use warnings;
#linecount.pl

die "usage; to print the number of lines and letters in a file, call: linecount.pl <file location/filename>\n" unless @ARGV >= 1;

my $lines = 0;
my $letters = 0;
while (<>) {	# file operator, reads one line at a time
	$lines++;
	$letters += length($_);
}
print "$lines\t$letters\n";








print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;