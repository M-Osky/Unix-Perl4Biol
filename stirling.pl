#!/usr/bin/perl  
# stirling.pl (Stirling's approximation to the factorial)  
# This little script can be used with any number (including non-integers!) as an aproximation of the factorial. Just call ->	$	stirling.pl number1.  
 
use strict; use warnings;  

my ($n) = (@ARGV);  
my $ln_factorial =  
    (0.5 * log(2 * 3.14159265358979))  
    + ($n + 0.5) * log($n)  
    - $n + 1 / (12 * $n)  
    - 1 / (360 * ($n ** 3));  
print 2.71828 ** $ln_factorial, "\n";



<STDIN>;