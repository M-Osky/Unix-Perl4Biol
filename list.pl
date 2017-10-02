#!/usr/bin/perl
#list.pl
use strict; use warnings;

my ($x, $y, $z) = (1, 2, 3);
print "\nx=$x; y=$y; z=$z\n";
($x, $y) = ($y, $x);
print "x=$x y=$y\n";

#Task p7.2:  Exchange the value of $x and $y without using list context

	# M'Ósky:	OK... If I can use intermediary variables is pretty straight-forward

my $int1 = $x;
my $int2 = $y;

my $y = $int1;
my $x = $int2;

print "x=$x y=$y\n";

<STDIN>;