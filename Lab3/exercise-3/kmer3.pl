#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

#!/pkg/bin/perl -w
# Program kmer3.pl
# Extension of kmer2.pl
# This finds all the overlapping k-mers of the input string. It builds
# an associative array (a hash) where each key is one distinct k-mer in the string,
# and the associated value is the last starting position where that
# k-mer is found. For example, if the input is ACACTCA and k is 2, then
# one key is AC with  value 3; another key is CA with value 6;
# another key is CT with value 4; and one key is TC with value 5.
# dg

print "Input the string\n";
my $dna = <>;
chomp $dna;
print "Input the length of the window\n";
my $k = <>;
chomp $k;

my %kmer = (); # this initializes an empty hash called kmer.
my $i = 1;
while (length($dna) >= $k) {
    $dna =~ m/(.{$k})/;
    print "$1, $i \n";
    $kmer{$1} = $i; # hash the key $1 into the hash called kmer, and set the value there to $i.
    $i++;
    $dna = substr($dna, 1, length($dna) - 1); #this removes the first character of the current $dna
}

foreach my $kmerkey (keys(%kmer)) {
    print "The last occurrence of string $kmerkey is in position 
$kmer{$kmerkey}\n";
}
