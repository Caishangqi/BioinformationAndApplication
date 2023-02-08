#!/pkg/bin/perl
#dg
#this reads in a filename that the user types at the terminal 
#and then reads all the lines of that file.
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

print "input the file name please\n";
open (INFO, <>);
while ( $line = <INFO>) {  # This is a classic Perl idiom that reads one
                           # line at a time in the file input by the user.
                           # As long as the read succeeds, the while loop
                           # continues, and it ends when all the lines in
                           # the file have been read.

if ($line =~ m/.*?ACCESSION .*?([A-Z]{1,2}\d{3,7})[ ,.;:?]/)  {
print "The input line does contain an Accession number, and it
is $1.  \n";  # the special variable $1 refers to what part of
              # $line matched 
              # to the part of the regular expression inside
              # the parentheses.
    
}
else  {
  print "The input line does not contain an Accession number\n";
}

print "The input line is \n$line";
}
