#!/usr/bin/perl  
# conditional.pl  <- Simple script to test equality between arguments. Call it as usual:	$	conditional.pl number1 number2

use strict; use warnings;  

my ($x, $y) = @ARGV;  
if ($x == $y) {  
    print "equal\n";  
}  
else {  
    print "not equal\n";  
}

<STDIN>;