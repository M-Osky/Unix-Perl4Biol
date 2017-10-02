#!/usr/bin/perl
use strict; use warnings;
#sorting.pl

my @list = qw( c b a C B A a b c 3 2 1); #Unsorted elements
my @sorted_list = sort @list; #This is a short way of writting this, but it should be: @sorted_list = sort {$a <=> $b} (@list);

print "default: @sorted_list\n";

#Perl sorts by default by ASCII value (using "cmp"), if we want to sort for instance numerically we need to use the "<=>"

@sorted_list = sort {$a <=> $b} @list;		#It will warn us that abc are not numeric values, it will only sort numerically the numbers
print "numeric: @sorted_list\n";

#Lets now sort numbers numerically but in reverse order

@list = qw (2 34 -1000 1.6 8 121 73.2 0);
@sorted_list = sort {$b <=> $a} @list;
print "reversed numeric: @sorted_list\n";

#Ideally we'll like to sort the values both numerically and alphabetically and with no differentiatiom between caps and lowercase

my @newlist = qw( c b a C B A a b c 3 2 1 -1.4 0);

@sorted_list = sort {$a <=> $b or uc($a) cmp uc($b)} @newlist;
print "combined: @sorted_list\n";


print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;