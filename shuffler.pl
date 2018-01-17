#!/usr/bin/perl
use strict; use warnings;
#shuffler.pl
#Project 3: This will shuffle a DNA sequence (or any text) so we can compare scores from the real one to check how provable they are in comparison with a random sequence.

die "usage; to shuffle a sequence or text string, call: shuffler.pl <text string>\n" unless @ARGV >= 1;

my @text = @ARGV;

my $textstring = join ("" , @text);
my @textarray = split ("" , $textstring);
my $long = @textarray;


print "\nYou introduced this text string:\n $textstring\n";
print "The number of bases/characters is: $long\n";


#define variables

my $i = 0;
my $pos1 = 0;
my $pos2 = 0;
my $temp = 0;
my $max = int(3*($long / 4)); #We'll exchange bases as many times as 75% of the total number

print "Number of shuffles = $max\n\n";

#Loop to interchange random bases/characters based in their position. 
foreach $i (0..$max) {
	$pos1 = int(rand($long));
	$pos2 = int(rand($long));
	until ($pos2 != $pos1) {$pos2 = int(rand($long))} #To be sure both positions are not the same
	$temp = $textarray[$pos1];
	$textarray[$pos1] = $textarray[$pos2];
	$textarray[$pos2] = $temp;
	}

my $shuffled = join ("" , @textarray);
print "\n\tThe new shuffled sequence is:\n$shuffled\n";


print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;