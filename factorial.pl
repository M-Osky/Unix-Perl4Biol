#!/usr/bin/perl
use strict; use warnings;
#factorial.pl

die "usage: to compute the factorial of a number call: factorial.pl <number>\n" unless @ARGV == 1;
my ($number) = @ARGV;
my $factor = 1;
for (my $i= 1; $i <= $number; $i++) {$factor *= $i};

print "$factor\n";








print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;