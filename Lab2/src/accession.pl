#!/pkg/bin/perl -w
# This is program accession.pl mentioned in lab 4.
# As a line is read, it checks if the line has the word ACCESSION
# followed by a space followed later by an accession number.
#It grabs the accession number if so. An accession number is
#a string that has either 1 or 2 capital letters, followed by
#a run of between 3 to 7 digitis. After the digits should
#be either a space, a comma, a period,
#a semi-colon, a colon, or a question mark. Write a file
#with several lines in it, some that have the word ACCESSION
# and then an accession number in it, and some that don't.
#Name the file yourself, and input that filename when the
#program executes.
# Note that the program right now will only report one ACCESSION number
# per line. It should be the first ACCESSION number on the line. See if you
# can modify the program to find the last ACCESSION number on the line. Later
# we will further modify the program to report all the ACCESSION numbers on
# the line.

print "type the input file name please\n";
open (INFO, <>);  # open the input file and assign the handle INFO

print "type the output file name please\n";
$myoutfile = <>;  # Read in the file name for the output.
open (OUTFO, "> $myoutfile"); # open the output file and assign the handle
                              #OUTFO

while ( $line = <INFO>) {     # Read one line at a time from INFO, until
                              # all lines have been read in.
                              # process each line in the block enclosed by
                              # nested {...}
if ($line =~ m/.*?ACCESSION .*?([A-Z]{1,2}\d{3,7})[ ,.;:?]/)  {
print OUTFO "The input line does contain an Accession number, and it
is $1.  \n";  # Note the use of OUTFO to direct the printing to the
              # file associated with OUTFO. Note no punctuation before
              # or after the word OUTFO.
}
else  {
  print OUTFO "The input line does not contain an Accession number\n";
}

print OUTFO "The input line is \n$line";

}  # This is the end of the while block. This } matches the { on while
   # line. Note that there are two nested {...} blocks inside this block
