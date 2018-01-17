#!/usr/bin/perl
use strict; use warnings;
#quitarhembras.pl



my $dirname = "D:/Dropbox/MOSKY/CURRO/BIOINFORMATICS/UNIXyPERL/USB/Unix_and_Perl_course/mark";

opendir(DIR, $dirname);
my @files = readdir(DIR);					#extract filenames
closedir(DIR);

#print "@files\n";
#print "$files[0]\n";

foreach my $file (@files) {					#process all the files one by one
	next if($file =~ /^\.$/);				#don't use any hidden file
	next if($file =~ /^\.\.$/);
	
	my $path = $dirname . "/". $file;
	
	print "$path\n";
	
	open(my $in, $path) or die "error openning $file for reading: $!";
	
	#create variables and arrays
	my @malestory = ();
	my @introinfo = ();
	my $k = 0;
	my $i = 0;

	while (<$in>){						#process the file line by line
		
		chomp;
		
		my $info = $_;
		$info =~ s/\s+$//;
		
		my @datacheck = split(//, $info);					#Split line character by character
		
		if ($datacheck[0] eq 0 || $datacheck[0] eq 1)  {	#if it starts with 0 or 1 it's a line with mark-recapture data.
			#select data from males
			my @indiv = split (/ /, $info);					#the columns are separated by spaces, write each column in a different position of the array
			my $femcheck = $indiv[-3];						#third column starting from the end must have coded the information of being female (1).
			#If is male (female = 0)
			if ($femcheck eq 0) {
				# Erase the information of age (span) and sex
				splice @indiv, -3, 1;	#delete column with female information
				pop (@indiv);			#delete column with age information (span)
				#pop (@indiv);
				my $male = join (' ' , @indiv);
				$malestory[$k] = $male;
				#if ($k==0) {print "\nNew file data will be:\n$malestory[$k]\n";}
				#else {print "$malestory[$k]\n";}
				$k++;
			}
			#if is female ($femcheck eq 1)just don't use that line of information
			else {print "-";}
		}
		
		#store the description information
		else {
			my @linech = split(/ /, $info);
			#print "\nFirst part of line = $linech[0]\n\n";
			#Clean it from data that is not being used
			my %linehash = map {$_ => 1}@linech;
			if ($linech[0] eq "ch") {
				splice @linech, 1, 1;
				splice @linech, -2, 1;
				my $description = join (' ', @linech);
				$introinfo[$i] = $description;
				#print "$introinfo[$i]\n";
				$i++;
			}
			elsif ($linech[1] eq "group") { $i++}
			elsif (exists $linehash{"Span"}) { $i++}
			
			#Keep the other lines
			else {
				$introinfo[$i] = $info;
				$i++;
			}
		}
	}
	close $in;

	my @fileready = (@introinfo, @malestory);
	@fileready = grep { $_ ne '' } @fileready;		#Delete empty lines/values

	# SAVE FILE
	open my $out, '>', "mark/$file.txt" or die "Cannot open output.txt: $!";

	# Loop over the array
	foreach (@fileready) {print $out "$_\n";} # Print each entry in our array to the file

	close $out; 

	print "\nFile $file done!\n\n";

}



print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
