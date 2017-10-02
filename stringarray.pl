#!/usr/bin/perl
use strict; use warnings;
#stringarray.pl

my @gene_names = qw(unc-10 cyc-1 act-1 let-7 dyf-2);
my $joined_string = join(", ", @gene_names);
print "$joined_string\n";

#It's fun, because we can actually use the "split" function as if it was a restriction enzime, only that the site is consumed in the process:
my $dna = "aaaaGAATTCttttttGAATTCggggggg";
my $EcoRI = "GAATTC";
my @digest = split($EcoRI, $dna);
print "@digest\n";






print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
