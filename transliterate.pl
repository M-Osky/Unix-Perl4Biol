#!/usr/bin/perl
# transliterate.pl a script trying to work with the different uses of tr/
use strict; use warnings;

my $text = "these are letters: abcdef, and these are numbers, 123456";
print "$text\n\n";

$text =~ tr/a/b/;				# change all "a" to "b"
print "$text\n";

$text =~ tr/bs/at/;				# change all "b" to "a", and "s" to "t"
print "$text\n";

$text =~ tr/123/321/;			# 1 becomes 3; and 3 becomes 1; 2 stays.
print "$text\n";

$text =~ tr/abc/ABC/;			# capitalice a, b and c.
print "$text\n";

$text =~ tr/ABC/X/;				# any "A", "B", and "C" will become "X".
print "$text\n";

$text =~ tr/d/DE/;				# wrong, this only changes "d" to "D",
print "$text\n";

# For long strings of text it could help to write the code in a different way

$text =~ tr [abcdefgh]
			[hgfedcba];
print "$text\n";

# We can use the transliterator to count how many changes are made

my $sequence = "AACTAGCGGAATTCCGACCGT";
my $g_count = ($sequence =~ tr/G/G/);		#Nothing changes in $sequence!
print "The letter G occurs $g_count times in $sequence\n";


$sequence =~ tr/A-Z/a-z/;					#Can work with ranges.
print "$sequence\n";





<STDIN>;