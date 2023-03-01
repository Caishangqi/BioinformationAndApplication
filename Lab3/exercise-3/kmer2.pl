#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
#!/pkg/bin/perl -w
# Program kmer2.pl
# Extension of kmer1.pl
# This finds and prints all the overlapping k-mers of the input string.
# dg

print "Input the string\n";
my $dna = <>;
chomp $dna;
print "Input the length of the window\n";
my $k = <>;
chomp $k;

while (length($dna) >= $k) {
    $dna =~ m/(.{$k})/;
    print "$1 \n";
    $dna = substr($dna, 1, length($dna) - 1); #this removes the first character in the current $dna
}