#!/usr/bin/perl
use strict; use warnings;
#	stats.pl by MOskar
#	Project 2: Write a program that calculates the count, sum, minimum, maximum, median, mean, variance, and standard deviation of the input numbers

die "Usage: stats.pl <number1> <number2> <etc>\n" unless @ARGV > 1;

my @numbers =  sort {$a <=> $b} @ARGV;
my $count = @numbers;

print "\nYou introduced the following numbers:\n\t@numbers\n";

print "\nThat's a total of $count numbers\n";

# summatory of the array
my $sum = 0;
foreach my $num (@numbers) {
	$sum = $sum + $num;
}

print "\nThe sum of all input numbers is = $sum\n";


# average
my $average = $sum / $count;

print "\nThe average (arithmetic mean) is = $average\n";


# minimum, maximum and median

my $min = $numbers[0];
my $max = $numbers[-1];

print "\nMinimum value = $min\n";
print "\nMaximum value = $max\n";

my $middlenum = $count / 2;
if ($count % 2 == 0) {
	my $middle2 = ($middlenum - 1);
	my $mediannum1 = $numbers[$middlenum];
	my $mediannum2 = $numbers[$middle2];
	my $medianeven = ($mediannum1 + $mediannum2) / 2;
		print "\nMedian = $medianeven\n";
}
else {
	my $middleodd = int($middlenum);
	my $medianodd = $numbers[$middleodd];
	print "\nMedian = $medianodd\n";
}

# variance and Standard deviation

my $sum_of_squares = 0;
for ( my $i = 0; $i < $count; $i = $i + 1)
	{
	$sum_of_squares = $sum_of_squares + ( $numbers[$i] - $average )**2;
	}

my $variance = $sum_of_squares / ($count - 1);
my $sd = sqrt($variance);

print "\nVariance = $variance\n";

print "\nStandard Deviation = $sd\n";






print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
