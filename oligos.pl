#!/usr/bin/perl
use strict; use warnings;
# oligos.pl by M.Ósky

die "usage: oligos.pl <file of oligos>\n" unless @ARGV == 1;

my (%sequences, %tm);		# One hash for the sequences of the oligos, another for their melting temperatures

# Process the file line-by-line
while (<>) {
	chomp;		#just in case, some sequences could be in more than one line
	
	# store the sequence
	my ($name, $seq) = split("\t", $_);		# $name will take the text before the tabulation, and $seq the text after the tabulation, for each line.
	$sequences{$name} = $seq;		# first hash assignment, we assign each sequence (each $seq) to the new hash $sequences for each key value ($name)
	
	# calculate and store Tm <- We use "transliterate" to count the number of times that each base is present
	my $A = $seq =~ tr/A/A/;
	my $C = $seq =~ tr/C/C/;
	my $G = $seq =~ tr/G/G/;
	my $T = $seq =~ tr/T/T/;
	my $tm = 2 * ($A +$T) + 4 * ($C + $G);		# simple Tm formula
	$tm{$name} = $tm;		# second hash assignment
}

print "\nName\tTm\tSequence\n";

#sort and report
foreach my $name (sort {$tm{$a} <=> $tm{$b}} keys %tm) {
	print "$name\t$tm{$name}\t$sequences{$name}\n";
}








print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;