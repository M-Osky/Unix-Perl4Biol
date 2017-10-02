#!/usr/bin/perl
use strict; use warnings;
#sumint.pl

die "usage: sumint.pl <number_max-limit>\n" unless @ARGV == 1;
my ($limit) = @ARGV;
my $sum = 0;
for (my $i = 1; $i <= $limit; $i++) {$sum += $i};
print "$sum\n";







print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;