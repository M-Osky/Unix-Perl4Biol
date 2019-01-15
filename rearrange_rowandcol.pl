#!/usr/bin/perl
use strict; use warnings;
#rearrangelandmarks.pl

# USAGE: set a directory and the script will read all the csv files in it,
# if there are more than one row per sample, it will re-arrange the data from the same sample in the same row.
# if there is files with samples (rows) with different number of columns you'll get empty columns and warnings (for samples with less columns).
# Does not matter how many rows each sample has, as far as they are consecutive and they all start with the same tag.
# Lines that start with a comma (","), comments (#text), and blank lines are skipped.

# Input file:
#	ID,		X,	Y
#	sample1,	4,	8
#	sample1,	15,	16
#	sample2,	23,	42
#	sample2,	21,	18
#
# Output file:
#	ID,		X1,	Y1,	X2,	Y2
#	sample1,	4,	8,	15,	16
#	sample2,	23,	42,	21,	18


# You need to set five parameters:


# 1) Set the directory/folder where your files (csv) are.
my $dirname = "D:/Dropbox/MOSKY/CURRO/BIOINFORMATICS/UNIXyPERL/USB/Unix_and_Perl_course/coord";


# 2) Headers?
# If the input file contains a first row with headers or tags set "1", if first row contains directly the data or variables, then = 0
my $headers = 1;

# 3) Set the headers you want for your columns ("comma separated") for example:
#my $columntags = "ID,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8";		# something like this
# or set "0" if the first row of the input file already contains headers as in the input file example.
my $columntags = 0;

# 4) Are lines with the same tag (sample name in the first column of each row) measurements of the same variable?
# $samevar=1 if all the rows with same tag are the same variable (and therefore all new columns should have the same header than originally)
# $samevar=0 if the rows with the same tag are different variables, points or markers for the same sample,each new row will have the original name + a number. As in the output example.
my $samevar = 0;

# 5) Set number of columns without taking into account the first column with individual tags.
my $cols = 2;	#Usually is = 2 for coordinates (X and Y) and number of loci for Structure genotypes.








##################################### Below this line don't touch anything unless you know what you are doing 



chdir $dirname;

my $newfolder = "out";
unless(-e $newfolder or mkdir $newfolder) {die "Unable to create the directory \"out\" at\n$dirname\nMay be you don't have the rights: $!\n"; }

print "\nDirectory \"out\" created to contain the outputs at\n$dirname\n";


opendir(DIR, $dirname);						#open the directory with the csv files
my @files = readdir(DIR);					#extract filenames
closedir(DIR);

closedir(DIR);

foreach my $file (@files) {					#process all the files one by one
	
	next if ($file =~ /^\.$/);				#don't use any hidden file
	next if ($file =~ /^\.\.$/);			
	next unless ($file =~ /\.csv$/);		#read only csv files
	
	my $path = $dirname . "/". $file;
	print "\n Working in:\n$path\n";
	
	open(my $data, $path) or die "error openning $file for reading: $!";
	

	#create/empty variables and arrays
	
	my $k=0;
	my $i=0;

	my $line=0;
	my @datacheck = ();
	my @newline = ();
	my $namerow = 0;
	my $header = 0;
	my @firstlineheader=();
	my @matrixalldata = ();
	my $samplename = 0;
	my @rowfirst = ();
	my $first = 0;
	my @activerow = ();
	my @rownext = ();
	my $next = 0;
	my $sample = 0;
	my $colnum = 0;
	my $colmax = 0;
	my @variablenames=();
	my @columnhead=();
	my $id = 0;
	my $num = 0;
	my $counter=0;
	my $maxiter=0;
	my @iter=();
	my @newnames = ();
	
	
	



	while (<$data>) {						

		chomp;	#clean "end of line" symbols
		
		next if /^(\s*(#.*)?)?$/;   # skip blank lines and comments
		
		$line = $_;
		$line =~ s/\s+$//;		#clean white tails in lines
		
		@datacheck = split(//, $line);	#split line character by character
		
		@newline= split(',', $line);	#split columns separated by commas (as is intended in a csv)
		$namerow = $newline[0];			#take the first column of the row (sample tag)
		
		# If you did this file in excel chances are that is full of empty lines with lots of commas, skip them
		if ($datacheck[0] eq",") {
			print "Line consisting in:  " . $line . "  skipped\n";
		}
		# If is the first line being processed, either copy the headers or add them if you wrote them above
		elsif ($i == 0 && $headers == 1) {
			if ($columntags ne 0) {
				$header = $columntags;
				$matrixalldata[$i]= $header;		#add headers as first element of an array
			}
			elsif ($columntags eq 0) {
				@firstlineheader = @newline[0..$cols];
			}
			$i++;								#keep track of lines processed
		}
		#If the inputfile doesnt have headers
		elsif ($i == 0 && $headers == 0 && $k == 0) {
			# If we added some headers
			if ($columntags ne 0) {
				$header = $columntags;
				$matrixalldata[$i]= $header;		#add headers as first element of an array
				
				$samplename = $namerow;				#save new sample tag for comparing with next 
				@rowfirst = @newline[0..$cols];		#save all the relevant info including tag
				$first = join (',', @rowfirst);	
				$activerow[$k] = $first;			#add it as the first element of an array
				
				$i++;
				$k++;
			}
			#If we don't want any header in our output file
			elsif ($columntags eq 0) {
				$samplename = $namerow;				#save new sample tag for comparing with next 
				@rowfirst = @newline[0..$cols];		#save all the relevant info including tag
				$first = join (',', @rowfirst);	
				$activerow[$k] = $first;			#add it as the first element of an array
				$k++;
			}
		}
		# First rows with data, save all the info (tag of first column and columns with data).
		elsif ($k == 0) {
			$samplename = $namerow;				#save new sample tag for comparing with next line
			@rowfirst = @newline[0..$cols];		#save all the relevant info including tag
			$first = join (',', @rowfirst);	
			$activerow[$k] = $first;			#add it as the first element of an array
			$k++;
		}
		# add as a different array elements the information from all the rows with same tag (first column)
		elsif ($samplename eq $namerow) {
			@rownext = @newline[1..$cols];
			$next = join (',', @rownext);
			$activerow[$k] = $next;
			$k++;
		}
		# When we reach a line with a different sample (first column tag)
		elsif($samplename ne $namerow) {
			# process info from the previous samples
			$sample = join (',', @activerow);	#concatenate info from the same sample
			$matrixalldata[$i] = $sample;			#add it as a element of an array
			# save the maximum number of columns
			$colnum = scalar @activerow;
			if ($colnum > $colmax) {
				$colmax = $colnum;
			}
			
			@activerow=();						#empty
			$i++;								#account number of processed line
			$k=0;								#reiniciate the data-per-sample counter
			
			# process the info from the new sample (different first column tag than previous)
			$samplename = $namerow;				#save new sample tag for comparing with next line
			@rowfirst = @newline[0..$cols];		#save all the relevant info including tag
			$first = join (',', @rowfirst);
			$activerow[$k] = $first;			#add it as the first element of an array
			$k++;
		}
	}
	# once there are no more rows, we need to save the sample that was being processed to the array with all the info
	$sample = join (',', @activerow);
	#if the last sample processed is different from the one being processed, add it at the end
	if ($matrixalldata[-1] ne $sample) {
		push (@matrixalldata, $sample);
	}
	else {
		print "\t(final line not saved. Did something go wrong?)\n";
	}
	
	
	# If we didn't write any headers, but they were in the first row of the file, we will create them for every column.
	if ($columntags eq 0 && $samevar==1 && $headers ==1) {
		@variablenames = @firstlineheader[1..$cols];
		@columnhead = @variablenames;
		$maxiter = ($colmax - 2);
		@iter= (1..$maxiter);
		foreach $a (@iter) {
			@columnhead = (@columnhead, @variablenames);
		}
		@firstlineheader = (@firstlineheader, @columnhead);
		$header = join (',', @firstlineheader);
		$matrixalldata[0]= $header;
	}
	# If we didn't write any headers, but they are in the first row of the file.
	# We will create a header for each row of the same sample (in the original file) to have a different header in the output
	elsif ($columntags eq 0 && $samevar ==0 && $headers ==1) {
		@variablenames = @firstlineheader[1..$cols];
		$id = $firstlineheader[0];
		@columnhead = @variablenames;
		$maxiter = ($colmax);
		@iter= (1..$maxiter);
		$counter= $cols-1;
		foreach $a (@iter) {
			foreach my $count (0..$counter) {
				@newnames[$count] = $variablenames[$count] . $a;
			}
			if ($a==1) {
				@columnhead = @newnames;
			} 
			else {
				@columnhead = (@columnhead, @newnames);
			}
		}
		@firstlineheader = ($id, @columnhead);
		$header = join (',', @firstlineheader);
		$matrixalldata[0]= $header;
	}
	
	close $data;
	#print @matrixalldata;



	# SAVE FILE
	
	my $output = $file;
	$output =~ s/profile/coord/;
	
	
	
	open my $out, '>', "out/$output.txt" or die "Cannot create output file out/$file.txt: $!";

	# Loop over the array
	foreach (@matrixalldata) {print $out "$_\n";} # Print each entry in our array to the file
	close $out; 

	print "\nFile $file transformed and saved as $output\n\n";

}

print "\n\n\n\t\t<Press Enter to exit>\n";

   <STDIN>;
