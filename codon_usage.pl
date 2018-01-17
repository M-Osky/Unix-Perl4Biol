#!/usr/bin/perl
use strict; use warnings;
#codon_usage.pl by M'Ósky -> how many times appears each codon and it's frequency

die "usage: codon_usage.pl <sequence>\n" unless @ARGV == 1;
my ($seq) = @ARGV;

my %count = ();		# individual codons, erase its contents
my $total = 0; 		# total codons

# extract each codon from the sequence and count it
for (my $i = 0; $i < length($seq); $i += 3) {
	my $codon = substr($seq, $i, 3);
	if (exists $count{$codon})	{$count{$codon}++}
	else						{$count{$codon} = 1}
	$total++;
}

# report codon usage of this sequence
foreach my $codon (sort keys %count) {
	my $frequency = $count{$codon}/$total;
	printf "%s\t%d\t%.4f\n", $codon, $count{$codon}, $frequency;
}








print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
