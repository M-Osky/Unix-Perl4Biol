#!/usr/bin/perl
use strict; use warnings;
#loops.pl

my @animals = qw(cat dog cow);
my @sounds = qw(Meow Woof Moo);
for (my $i = 0; $i < @animals; $i++) {
	print "$i) $animals[$i] $sounds[$i]\n";
}
foreach my $animal (@animals) {
	print "$animal\n";
}

for my $i (0..5) {print "$i\n"};

my $x = 1;
while($x < 1000){
	print "$x\n";
	$x += $x;
}

while (@animals) {
	my $animal = shift @animals; #We shorten the array in each loop, the loop will end when the array lenght is 0
	print "$animal\n";
}

do {
	print "hello\n";
} while (0);

# The followin line were interesting as an experiment, but they hide the results from the above lines, so it's better to turn them in comments
#	while (0) {
#		print "this statement is never executed because 0 is \"false\" in Perl\n";
#	}
#	while (1) {
#		print "this statement loops forever unless you \"force stop\" with Ctrl + C\n";
#	}


print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;

