#!/usr/bin/perl
use strict; use warnings;
#primes.pl -> To calculate the prime numbers between 100 and 200

my $n = 0;
while (1) {
	$n++;
	redo if $n < 100;
	last if $n > 200; # exits the "while" loop
	
	my $prime = 1; # assumed true
	for (my $i = 2; $i < $n; $i++) {
		if ($n % $i == 0) {
			$prime = 0; # now known to be false
			last; #breaks out of for lopp
			}
	}
	
	print "$n\n" if $prime;
}








print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
