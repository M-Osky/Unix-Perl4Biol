#!/usr/bin/perl
# undefined.pl	->	I'll use this script to check what happens when we do NOT include the "use warnings" but there are some problems, in this case using lists and they are not the same lenght. 
use strict; #use warnings

my ($x, $y, $z) = (1, 2, 3, 4, 5);
print "x=$x; y=$y; z=$z\n";

my ($a, $b, $c) = (1, 2);
print "c=$c\n";
print length($c), "\n";
print $a + $c, "\n";

# c is an undefined value, but at the same time is used as zero, this is problematic. Better use "use warnings" to indetify this kind of problems.



print "\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;