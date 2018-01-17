#!/usr/bin/perl
use strict; use warnings;
#intrkmercheck.pl by M'Ósky 
#Use to compare introns that occur at different positions within a gene in order to determine just how different ‘early’ introns are compared to "late" introns, in terms of their nucleotide composition.
# This program is inspired by the Rose et al.2008 paper, it showed that introns near the promoter are compositionally distinct from introns farther downstream. This leads to a gene expression phenomenon known as ‘intron-mediated enhancement’ or IME.


die "usage; to check if the distribution of combinations of k bases are different in the first introns than in further away introns,\n\tcall: intrkmercheck.pl k <intron sequence file>\n" unless @ARGV >= 1;

# In a near future, when I am more advanced in the course I'll try to make that the program looks everything betweeen the ">" of the name and the next ">" (name of the next sequence) and return the name (first ">sequencename" before the match"), but right now it'll be easier to just transform the file so all the sequence is in the same line. I'll do it with Unix, as it seems more straight fordward.

#	cat Data/Arabidopsis/intron_IME_data.fasta | sed 's/\(^>.*\)/!\1_/' | tr '\n' '@' | tr '!' '\n' | sed 's/@//g' | sed '/^$/d' > Data/Arabidopsis/intron_IME_dataV2.fasta
#	cat		open file
#	| sed		find the line with the ">sequencename", keep it (that's why we use the parenthesis "\(>name*\)") and add exclamation marks before and a "_" after
#	| tr		change all the "next line separators" to "@"
#	| tr		change the recently added exclamation marks to "next line separators"
#	| sed		delete the "@"
#	| sed		delete empty lines
#	>		save the changes to a new file.


# Extract the info
my $k = $ARGV[0];
open(my $in, "<$ARGV[1]") or die "error openning $ARGV[1] for reading";

# Declare the variables
my $kend = $k -1;
my $n1 = 0;
my $no = 0;
my $i1 = 0;
my $io = 0;
my $position = 0;
my %firstuniqkmers = ();
my %otheruniqkmers = ();
my @firstallkmers = ();
my @otherallkmers = ();
my @seq = ();
my $long = 0;
my $last1 = $n1 + $i1;
my $lasto = $no + $io;
print "\n";



# Line by line check the sequences and print if there is match
while (<$in>) {
	# Assign each piece of information to a different variable
	chomp;
	my ($name, $intron, $num, $cds, $sequence) = split( '_' , $_);
	$position = $intron;
	$position =~ s/i//;
	print "The intron $name\t is in position $position, and its sequence is\n $sequence\n";

	#Split the sequence and count
	@seq = split(//, $sequence);
	$long = scalar @seq;
	my $end = $long-1;
	print "\tThe sequence is $long bases long\n\n";
	$i1 = 0;
	$io = 0;
	
	print "The kmers found ";
	# Check intron position, if is first position goes to a different loop than the rest
	if ($position == 1) {
	print "in this i1 intron are:\n";
	# # Assign each kmer to a pair key-value in a hash, repeated kmers will overwrite the previous. Also, assign each k-mere (uniq or not) to a new position in the array
		until (($i1+$kend) >= $long) {
			my @temparray1 = ();
			my $tempkmer1 = 0;
			foreach my $index ($i1 .. ($i1+$kend)) {
				push (@temparray1, $seq[$index]);
			}
			
			$tempkmer1 = join ('', @temparray1);
			$firstuniqkmers {$tempkmer1} = $tempkmer1;
			$firstallkmers [$i1+$n1] = $tempkmer1;
			print "$firstallkmers[$i1+$n1]  ";
			$i1++;
		}
		$n1 = $n1 + ($long - $kend);
		$last1 = $n1 + $i1;
	}
	else {
	print "in this other intron are:\n";
	# Assign each kmer to a pair key-value in a hash, repeated kmers will overwrite the previous. Also, assign each k-mere (uniq or not) to a new position in the array
		until (($io+$kend) >= $long) {
			my @temparrayo = ();
			my $tempkmero = 0;
			foreach my $index ($io .. ($io+$kend)) {
				push (@temparrayo, $seq[$index]);
			}
			
			$tempkmero = join ('', @temparrayo);
			$otheruniqkmers {$tempkmero} = $tempkmero;
			$otherallkmers [$io+$no] = $tempkmero;
			print "$otherallkmers[$io+$no]  ";
			$io++;
		}
		$no = $no + ($long - $kend);
		$lasto = $no + $io;
	}
	print "\n\n";
}

close $in;

# Last position
$last1 = ($n1 - ($long - 2)) + $i1 - 1;		# Para $k = 3
$lasto = ($no - ($long - 2)) + $io - 1;		# Para $k = 3

# Descriptive
my @firstuniqkmers = values %firstuniqkmers;
my $firstnumunic = scalar @firstuniqkmers;
my $firstallsize = scalar @firstallkmers;
print "\n\nIn the first introns there are $firstnumunic uniq kmers from a total of $firstallsize kmers\nUnique: @firstuniqkmers\n";
print "\nThe first kmer found was $firstallkmers[0], the last kmer is $firstallkmers[$last1]\n";
my @otheruniqkmers = values %otheruniqkmers;
my $othernumunic = scalar @otheruniqkmers;
my $otherallsize = scalar @otherallkmers;
print "\n\nIn the rest of introns there are $othernumunic uniq kmers from a total of $otherallsize kmers\nUnique: @otheruniqkmers\n";
print "\nThe first kmer found was $otherallkmers[0], the last kmer is $otherallkmers[$lasto]\n";

# Frequency of uniq kmers in
my $unicfreq1 = $firstnumunic / $firstallsize;
my $unicfreqo = $othernumunic / $otherallsize;


my $allkmers1 = join ('_' , @firstallkmers);
my %freq1 =();

# count how many times appears each kmere and calculate the frequency
while (my ($key, $value) = each %firstuniqkmers) {
	my $count1 = ($allkmers1 =~ s/$key/$value/g);
	my $frequency1 = $count1 / $firstallsize;
	$freq1 {$key} = $frequency1;
}

print "\nList of k-meres from the first introns and their frequency:\n";
foreach my $name (sort keys %freq1) {
	printf "\t%s:\t%.4f\n", $name, $freq1{$name};
}

# Now the same for the rest of introns
my $allkmerso = join ('_' , @otherallkmers);
my %freqo =();

# count how many times appears each kmere and calculate the frequency
while (my ($key, $value) = each %otheruniqkmers) {
	my $counto = ($allkmerso =~ s/$key/$value/g);
	my $frequencyo = $counto / $otherallsize;
	$freqo {$key} = $frequencyo;
}

print "\nList of k-meres from the other introns and their frequency:\n";
foreach my $name (sort keys %freqo) {
	printf "\t%s:\t%.4f\n", $name, $freqo{$name};
}

# Now we need to do a k-mer list with all the unique k-mers
while (my ($key, $value) = each %firstuniqkmers) {
	my $i = 0;
	if (exists $freqo {$key})	{ $i++; }
	else 						{$freqo {$key} = 0.00000000001;}
}

while (my ($key, $value) = each %otheruniqkmers) {
	my $i = 0;
	if (exists $freq1 {$key})	{ $i++; }
	else 						{$freq1 {$key} = 0.00000000001;}
}
# I didn't know how to deal with the zeros in the odds-ratio so I decided to change them with a really low frequency. Hopefully with real big fasta files there will not be frequencies of zero.

my @kmerlisto = keys %otheruniqkmers;
#my @sortedkmerlisto = sort @kmerlisto;

#print "\nList of all k-meres and their frequencies in the first intron:\n";
#foreach my $name (sort keys %freq1) {
#	printf "\t%s:\t%.4f\n", $name, $freq1{$name};
#}


print "\n\nThe log-odds ratio between first intron k-mers and k-mers from other introns are:\n";
# Calculate and report the log-odds ratio for each k-mer

my %logodd = ();
foreach my $kmer(@kmerlisto) {
	my $odds_ratio = $freq1{$kmer} / $freqo{$kmer};  
	my $lod = log($odds_ratio);  # Perl’s log() function uses base e, so...  
	my $lod2 = $lod / log(2);    # ...need to convert base e to base 2  
	
	$logodd {$kmer} = $lod2;
}

foreach my $name (sort { $logodd{$a} <=> $logodd{$b} } keys %logodd) {
    printf "\t%s\t%.4f\n", $name, $logodd{$name};
}









print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;