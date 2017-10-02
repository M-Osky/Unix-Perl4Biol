#!/usr/bin/perl
use strict; use warnings;
#loop.pl

for (my $i = 0;					# Initialization: Initial variable
		$i < 10;				# Validation: Condicion checked for the loop to keep going
		$i = $i + 1)			# Update: something must change in each loop
			{
			 print "$i\n";		# What to execute in each loop
			}

for (my $i = 50; $i >= 45; $i--) {print "$i\n"};
for (my $i = 0; $i < 100; $i += 10) {print "$i\n"};
			
			
			
			
			
			
			print "\n\n\n\t\t<Press Enter to exit>\n";
			
			   <STDIN>;