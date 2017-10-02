#!/usr/bin/perl  
# strings.pl  
use strict; use warnings;  

my $s1 = "ABC";  
my $s2 = "ac";  
my $s3 = $s1 . " " . $s2;  
print "$s3\n";

if    ($s1 eq $s2) {print "same string\n"}  
	elsif ($s1 gt $s2) {print "$s1 is greater than $s2\n"}  
		elsif ($s1 lt $s2) {print "$s1 is less than $s2\n"};
		
#Check how/if the string and numeric comparison operators work when using string and numbers

#Lenght (number) as string
my $ls1 = length($s1); my $ls2 = length($s2);

if    ($ls1 eq $ls2) {print "same string length\n"}  
	elsif ($ls1 gt $ls2) {print "$ls1 is greater than $ls2\n"}  
		elsif ($ls1 lt $ls2) {print "$ls1 is less than $ls2\n"};

#string as number
if    ($s1 == $s2) {print "same value\n"}  
	elsif ($s1 > $s2) {print "$s1 is greater than $s2\n"}  
		elsif ($s1 < $s2) {print "$s1 is less than $s2\n"};

#Strings vs numbers as strings

if    ($s1 eq $ls2) {print "same string length\n"}  
	elsif ($s1 gt $ls2) {print "$ls1 is greater than $ls2\n"}  
		elsif ($s1 lt $ls2) {print "$ls1 is less than $ls2\n"};

#numbers vs strings as numbers

if    ($ls1 == $s2) {print "same value\n"}  
	elsif ($ls1 > $s2) {print "$ls1 is greater than $ls2\n"}  
		elsif ($ls1 < $s2) {print "$ls1 is less than $ls2\n"};
		
print "Aparently the only forbiden operation here is to use the \"==\" between non-numeric data\n";

<STDIN>;