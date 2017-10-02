#!/usr/bin/perl  
# elsif.pl  
use strict; use warnings;  

my ($x) = @ARGV;  

if ($x >= 3) {  
    print "x is at least as big as 3\n";  
}  
elsif ($x >= 2) {  
    print "x is at least as big as 2, but less than 3\n";  
}  
elsif ($x >= 1) {  
    print "x is at least as big as 1, but less than 2\n";  
}  
else { print "x is less than 1\n"; }