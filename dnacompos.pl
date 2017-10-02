#!/usr/bin/perl  
# dnacompos.pl by MÓscar 

#	Project 1: DNA composition

#***********Background********** 
#	The program will read a sequence and determine its length and composition: 
#    length of the sequence
#    total number of A, C, G, and T nucleotides
#    fraction of A, C, G, and T nucleotides (i.e. %A, %C etc.)
#    GC fraction 

#***********Background********** 

use strict; use warnings;
#chmod 777 dnacompos.pl;  <- This should give full rights (read, write and execute) to all users, but is not working, I need to look more info about this.

	# Program:

my $argumentnumber = @ARGV;
my $dnaseq = $ARGV[0];


#Check if the data is right: This will kill the process if there is no data or if the input data in in the wrong format.
if($argumentnumber != 1) {die "To use this program call the program file name and the dna sequence to examine:\n\t dnacompos.pl <your dna sequence>\n";}
	elsif ($dnaseq =~ m/[efijlopqxz]/i) {die "Sorry, there is at least one non-DNA character in your input sequence.\n";}																	
# The "die" command will close the window if we run it from notepad++, we wouldn't see the message unless we call the program from bash


my $dnalong = length($dnaseq);
	print "\n\n\tYour sequence\n$dnaseq\n\tis $dnalong nucleotids long.\n";
	
#Nucleotide count and percentage
	
my $a_count = ($dnaseq =~ tr/A/A/);		
my $c_count = ($dnaseq =~ tr/C/C/);		
my $t_count = ($dnaseq =~ tr/T/T/);		
my $g_count = ($dnaseq =~ tr/G/G/);		
my $a_p100 = (($a_count*100)/$dnalong);
my $c_p100 = (($c_count*100)/$dnalong);
my $t_p100 = (($t_count*100)/$dnalong);
my $g_p100 = (($g_count*100)/$dnalong);
my $gc_fract = ((($g_count+$c_count)*100)/$dnalong);

	print "\tthere are $a_count As ($a_p100% of the total)\n";
	print "\t          $c_count Cs ($c_p100% of the total)\n";
	print "\t          $t_count Cs ($t_p100% of the total)\n";
	print "\t      and $g_count Gs ($g_p100% of the total),\n";
	print "\tand the total GC fraction is $gc_fract%\n";
	
	

print "\n\n\t\t<Press Enter to exit>\n";

<STDIN>;