#!/usr/bin/perl
use strict; use warnings;
#quitarhembras.pl
#this is a very specific script to erase all the lines of a file that have a "1" in one specific column,
# I used this to erase the females from a input file for Mark and RMark
die "usage; to erase data belonging to females from a file, call: quitarhembras.pl file.inp <Mark input file>\n" unless @ARGV >= 1;

open(my $in, "<@ARGV") or die "error openning @ARGV for reading: $!";

my @malestory = ();
my @introinfo = ();
my $k = 0;
my $i = 0;

while (<$in>){
	
	chomp;
	
	my $info = $_;
	my $line = $info;
	$line =~ s/ /_/g;
	
	#split the sata from the description info
	my @datacheck = split(//, $line);
	
	if ($datacheck[0] eq 0 || $datacheck[0] eq 1)  {
		#select data from males
		my @indiv = split (/_/, $line);
		my $femcheck = $indiv[-3];
		if ($femcheck eq 0) {
			# Erase the information of age (span) and sex
			splice @indiv, -3, 3;
			my $male = join ('' , @indiv);
			$malestory[$k] = $male;
			if ($k==0) {print "\nNew file data will be:\n$malestory[$k]\n";}
			else {print "$malestory[$k]\n";}
			$k++;
		}
		#deleted lines
		else {print "-\n";}
	}
	#store the description information
	else {
		$introinfo[$i] = $info;
		if ($i== 0) {print "\nThe introduction information says:\n$introinfo[$i]\n";}
		else {print "$introinfo[$i]\n";}
		$i++;
	}
}

close $in;


my @fileready = (@introinfo, @malestory);

# SAVE FILE
open my $out, '>', "@ARGV.txt" or die "Cannot open output.txt: $!";

# Loop over the array
foreach (@fileready) {print $out "$_\n";} # Print each entry in our array to the file

close $out; # Not necessary, but nice to do

print "\nFile @ARGV done\n";


print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
