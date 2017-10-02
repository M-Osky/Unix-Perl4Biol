#!/usr/bin/perl  
# nested_conditional.pl  
use strict; use warnings;  

my ($x, $y) = @ARGV;  
if ($x > $y) {  
    print "$x is greater than $y\n";  
    if ($x < 5) {  
        print "$x is greater than $y and less than 5\n";  
    }  
} else {  
    print "$x is not greater than $y\n";  
}