#!/usr/bin/perl -w
#dg
#this reads in the first line from testfile and tests to see if
#the line contains what looks like a dna sequence of length at least three,
#either at the start of the line, or prepended by a space or an
# = or a >.
#If it does, then it prints the sequence
#else it prints a message that the line contains no sequence.
#At the end it prints the original sequence to show that is has
#not been modified. Make a file called testfile and try the
#program out. Change the contents of testfile to try different
#conditions. The straight line | in a regular expression is
# an OR. 

$file = 'ex5_testfile.txt';
open (INFO, $file);
$line = <INFO>;
# [atcgATCG]
if ($line =~ m/(^| |=|>)([atcgATCG]{3,})/ ) {
    print "The input line does contain what looks like a dna sequence of length at least three, and it is $2 \n";
}
else  {
    print "The input line does not contain a dna sequence\n";
}

print "The input line is \n$line\n";

# The input line does contain what looks like a dna sequence of length at least three, and it is ACC
# The input line is
# The primary ACCESSION number might be something like U63121 or maybe the ACCESSION is FA10325, or the ACCESSION is PQ3469. I don't know what the sequences are for these numbers. Maybe they are atcGGGAcatcaGGG or maybe not. Is this another ACCESSION number
# NO9978 or is it a telephone number. Perhaps XYzCATCGGAPQ is a DNA string? What will the program do with it? Is that what you want it to do?