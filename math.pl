#!/usr/bin/perl  
# math.pl  
use strict; use warnings;  

my $x = 3;  
my $y = 2;  
print "$x plus $y is ", $x + $y, "\n";  
print "$x minus $y is ", $x - $y, "\n";  
print "$x times $y is ", $x * $y, "\n";  
print "$x divided by $y is ", $x / $y, "\n";  
print "$x modulo $y is ", $x % $y, " (remainder of division)" . "\n";  
print "$x to the power of $y is ", $x ** $y, "\n" . "\n";


print "the absolute value of -$x is ", abs(-$x), "\n";  
print "the natural log of $x is ", log($x), "\n";  
print "the square root of $x is ", sqrt($x), "\n";  
print "the sin of $x is ", sin($x), "\n";  
print "a random number up to $y is ", rand($y), "\n";  
print "a random integer up to $x x $y is ", int(rand($x * $y)), "\n";

#In the examples above, the print() function outputs text as well as the actual mathematical operations. This is fairly uncommon in real programming. Generally, we want to make some computation, store that value, and do more computations. To store values, we need to create a new variable that will hold the contents.

my $z = ($x + $y) / 2;  
print "$z\n";


<STDIN>;