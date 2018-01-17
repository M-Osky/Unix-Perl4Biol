#!/usr/bin/perl
use strict; use warnings;
#name_search.pl		This program should be able to look for a determinate sequence name or aminoacids sequence in a fasta file and print back its name

die "\nusage; to search if a name corresponds with any protein's sequence name, call:\tname_search.pl <protein file> <name>\n" unless @ARGV == 2;

# In a near future, when I am more advanced in the course I'll try to make that the program looks everything betweeen the ">" of the name and the next ">" (name of the next sequence) and return the name (first ">sequencename" before the match"), but right now it'll be easier to just transform the file so all the sequence is in the same line. I'll do it with Unix, as it seems more straight fordward.

#	cat Data/Arabidopsis/At_proteins.fasta | sed 's/\(^>.*\)/!\1 \| /' | tr '\n' '@' | tr '!' '\n' | sed 's/@//g' | sed '/^$/d' > Data/Arabidopsis/At_proteins_v2.fasta
#	cat		open file
#	| sed		find the line with the ">sequencename", keep it (that's why we use the parenthesis "\(>name*\)") and add exclamation marks before and a "|" after
#	| tr		change all the "next line separators" to "@"
#	| tr		change the recently added exclamation marks to "next line separators"
#	| sed		delete the "@"
#	| sed		delete empty lines
#	>		save the changes to a new file.


#Number of lines
open(my $in, "<$ARGV[1]") or die "error openning $ARGV[1] for reading";


my $lines = 0;
for ($lines=0; <$in>; $lines++) { };
close $in;

# Extract the info
my $word = $ARGV[0];
my $name = uc $word;
open($in, "<$ARGV[1]") or die "error reading $ARGV[1] for reading";

# Declare the variables
my $match = 0;
my $i = 0;

# Line by line check the sequences and print if there is match
while (<$in>) {
	chomp;
	my ($prot, $symbol, $info, $ch, $seq) = split( '\|' , $_);
	if (index ($seq, $name) != -1) {
		if ($match == 0)	{
			print "\n The word \"$name\" is found in the sequence of the protein/s:\n\t$prot\n";
			$match = $match + 1;
			$i = $i + 1;
		}
		else			{
			print "\t$prot\n";
			$match = $match + 1;
			$i = $i + 1;
		}
	}
	else	{
		if ($lines <= $i + 1 && $match == 0) {print "\n The word \"$name\" is not found in any of the protein sequences\n";}
		else				 {$i = $i + 1;}
	}
}

close $in;









print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
