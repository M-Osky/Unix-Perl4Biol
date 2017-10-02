#!/usr/bin/perl  
# poissoncheck.pl by MÓscar 

#	Project 0: POISSON

#***********Background********** 
#	We have variation in the depht of coverage of a genome alignment. We could expect and have a common regular depht of coverage (10x), but at some times we can have lower or higher values (5x and 20x); this could be a random fluctuation, or the lower values (5x) could correspond to an haploid region and the higher (20x) to a duplication.

#	With the Poisson distribution we will calculate how likely a given coverage (5X OR 20X) is given an expected value of coverage (10x)

#	The Poisson distribution has two parameters: lambda and k.
#		Lambda is an integer greater than zero. It is both the mean (expected value) and the variance. In our case, lambda can be 10. 
#		k is a non-negative integer. It corresponds with the number of observations seen. This can be 5 or 20. In addition we could use 0 to check if areas of the genome with no reads aligned to them is just by stochastic reasons or there is biological reasons under the Poisson model.
#***********Background********** 

use strict; use warnings;  

	# Program:




#Get values

my ($lambda, $k) = @ARGV;  #This will be the first line of the code once is ready


#Check if the input value for lambda is correct
my $intlamb = int($lambda);		my $diflamb = ($lambda - $intlamb);


if ($lambda <= 0) {print "\nWrong! lambda ($lambda) must be greater than zero.\n\n";}
	elsif ($diflamb != 0) {print "\nWrong! lambda ($lambda) must be an integer.\n\n";}
		else {print "\nRight! lamda ($lambda) is an integer greater than zero.\n\n";}


#	Check if the input value for k is correct
my $intk = int($k);		my $difk = ($k - $intk);

if ($k < 0) {print "Wrong! k ($k) must be non-negative.\n\n";}
	elsif ($k == 0) {print "Mmm... Yes, k = 0 should be allright.\n\nUnfortunately the Striling method to approximate the factorial of k, does not work with 0\nLet me look for another method to calculate factorials and try again when updated.\n\t\t\tSorry!\n\n";}
		elsif ($difk != 0) {print "Wrong! k ($k) must be an integer.\n\n";}
			else {print "Right! k ($k) is a non-negative integer.\n\n";}



if ($lambda <= 0) {print "\tTry with different values next time.\n\n\t\tPress Enter to exit\n";}
	elsif ($diflamb != 0) {print "\tTry with different values next time.\n\n\t\tPress Enter to exit\n";}
		elsif ($k < 0) {print "\tTry with different values next time.\n\n\t\tPress Enter to exit\n";}
			elsif ($k == 0) {print "\t(You can still try with different values)\n\n\t\tPress Enter to exit\n";}
				elsif ($difk != 0) {print "\tTry with different values next time.\n\n\t\tPress Enter to exit\n";}
					else {
						
						  #Calculate the probability (Poisson distribution)
						
							#First: Striling method to approximate the factorial of k ($k_fact)
						my $ln_factorial =  
							(0.5 * log(2 * 3.14159265358979))  
							+ ($k + 0.5) * log($k)  
							- $k + 1 / (12 * $k)  
							- 1 / (360 * ($k ** 3));  
						my $k_fact = 2.71828 ** $ln_factorial;
						
							#Now lambda elevated at k power ($lambpwrk)
						my $lambpwrk = $lambda ** $k;

							#Then we calculate e^-lambda
						my $lambneg = $lambda*-1;
						my $elamb = 2.71828**($lambneg);

							#And finally, the probability of the number of events in the Poisson distribution:

						my $p_poiss = ($lambpwrk / $k_fact) * $elamb;

						  # Print the result:

						  print "The Probability of $k events in the interval, given the average value (lambda = $lambda) and according to the Poisson distribution is $p_poiss\n\n\tp = $p_poiss\t\t";
						
						if ($p_poiss >= 0.05) {print "Probably that rate of events is probably due to chance\n\n\t\tPress Enter to exit\n";}
							elsif ($p_poiss >= 0.01) {print "That rate of events is probably not due to chance\n\n\t\tPress Enter to exit\n";}
								else {print "That rate of events is clearly out of the natural rate of events\n\n\t\tPress Enter to exit\n";}
						 };





<STDIN>;
