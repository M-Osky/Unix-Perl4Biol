#!/usr/bin/perl
# array.pl
use strict; use warnings;

my @animals = ('cat', 'dog', 'pig');
print "1st animal in array is: $animals[0]\n";
print "2nd animal in array is: $animals[1]\n";
print "Entire \"animals\" array contains: @animals\n";

print "@animals [0]\n"; #This is a common mistake, calling an element of an array using the array symbol "@" in despite of the variable symbol "$". Is so common, that is seems that it will be "legal" in some near future version of Perl.

push (@animals, "fox"); #The array now is longer, we added "fox" at the end of the list
print "\nWe can add a new element to the list: fox\n";
my $length = @animals; #If we assign a scalar variable to a list, the variable becomes the length of the list
print "The array now contains $length elements: @animals\n";

my ($anim) = @animals; #Watch out, this is not the same!

print "The variable \$anim is not the legth of the array, as the line of code is written like a list assignment, \$anim = $anim\n";

my ($anim1, $anim2, $anim3, $anim4) = @animals;
print "\nThis should show the difference between\nmy \$length = \@animals;\nand\nmy (\$anim) = \@animals;\n";
print "-> We write: my (\$anim1, \$anim2, \$anim3, \$anim4) = \@animals;\n\@animals = @animals\n\$anim1 = $anim1, \$anim2 = $anim2, \$anim3 = $anim3, \$anim4 = $anim4\n";
print "And of course \$anim = $anim, we were just assigning the elements from the \@animals array to a list, it was just that the first list only had one element, the variable \$anim.\n\n";

my @animals2 = @animals; #Make a copy
@animals = (); #If we assign an array to an empty list, basically we erase its contents
print "Animals array now contains: @animals\n";
print "Animals2 array now contains: @animals2\n";

unshift (@animals2, "lizard"); #we added an element to the BEGINNING of the list
print "The array is now: @animals2\n";

my $popped_value = pop(@animals2); #remove the last value from the list
print "The array is now: @animals2\n";

my $shifted_value = shift(@animals2); #remove the first value from the list
print "The array is now: @animals2\n";

pop(@animals2);
print "The array is now: @animals2\n"; #we don't need to save popped or shifted values.

my @more_animals = ("lizard", "ant", "butterfly", "dormouse", "fish", "emu");
push (@animals2, @more_animals);
@animals = @animals2;
print "This is the new Animals array: @animals\n";

#We can do all of this and more with Splice, could be alittle more of work but sure is costumizable

splice (@animals, 2, 3);
print "\nIn the position 2 (Perl starts counting on 0), we deleted three elements:\n@animals\n";

splice (@animals, 3, 0, "duck", "mouse", "jerbo");
print "In the position 3, we removed 0 elements (delete nothing), but added three new animals:\n@animals\n";

print "\nAnimal at array position 1.2 is $animals[1.2]\n";
print "\nAnimal at array position 1.7 is $animals[1.7]\n";
print "\nAnimal at array position -1 is $animals[-1]\n";
print "array length = ", scalar(@animals), "\n"; #Is the same that doing $length = @array but without needing to create a new variable!

print "Animal at array position \"tocamela\" is ", $animals["tocamela"], "\n"; #We will recive the warning that "tocamela" isn't a numeric argument, but anyway as it's a string argumrnt its numeric value is equivalent to zero, so the program will print the element in the position 0










print "\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
