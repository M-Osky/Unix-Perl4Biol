#!/usr/bin/perl  
# pow.pl, an simple script to calculate "X to the power of Y" by M'Ósky

# Use: write this line in the command promt -> $ pow.pl number1 number2
# 		And it will calculate the number1 at the power of number2

use strict; use warnings;  

my ($x, $y) = @ARGV;  
print $x ** $y, "\n";

<STDIN>;