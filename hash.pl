#!/usr/bin/perl
use strict; use warnings;
#hash.pl

my %genetic_code = ('ATG', 'Met', 'AAA', 'Lys', 'CCA', 'Pro');
print "$genetic_code{'ATG'}\n";

foreach my $key (keys %genetic_code) {
	print "$key $genetic_code{$key}\n";
}

my @keys = keys(%genetic_code);
my @vals = values(%genetic_code);
print "keys: @keys\n";
print "values: @vals\n\n";


# let's sort it

foreach my $key (sort keys %genetic_code) {
	print "$key $genetic_code{$key}\n";
}


# Addingnew values (and keys)

$genetic_code{CCG} = 'Pro';
$genetic_code{AAA} = 'Lis';

if (exists $genetic_code{AAA})	{print "\nAAA codon has a value\n\n"}
else							{print "\nNo value set for AAA codon\n\n"}

delete $genetic_code{AAA};

foreach my $key (sort keys %genetic_code) {
	print "$key $genetic_code{$key}\n";
}




print "\n\n\n\t\t<Press Enter to exit>\n";


   <STDIN>;