#!/usr/bin/perl  
# float.pl  
use strict; use warnings;  

my $x = 0.1 + 0.1 + 0.1;  
my $y = 0.3;  
print $x, "\t", $y, "\t", $x - $y, "\n"; # \t is a tab character

#	Don't directly compare variables that include "floats" (decimals or floating points numbers) because their values can be not exactly the same, instead ask if their difference is greater than some small float number --> float.p

my $threshold = 0.001;  
if (abs($x - $y) < $threshold) {print "close enough\n"}

<STDIN>;