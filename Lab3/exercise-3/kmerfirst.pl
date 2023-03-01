#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
#!/pkg/bin/perl -w
# Program kmerfirst.pl
# This program finds all the overlapping k-mers of the input string. It builds
# an associative array where each key is one distinct k-mer in the string,
# and the associated value is the starting position where that
#k-mer is FIRST found.  Compare this to kmer2.pl

print "Input the string\n";
my $dna = <>;
chomp $dna;
print "Input the length of the window\n";
my $k = <>;
chomp $k;

my %kmer = (); # This initializes the hash called kmer.
my $i = 1;
while (length($dna) >= $k) {
    $dna =~ m/(.{$k})/;
    print "$1, $i \n";
    if (!defined $kmer{$1}) {
        #defined is a function that returns true
        # if a value has already been assigned to
        # $kmer{$1}, otherwise it returns false. 
        # the ! character is the negation, so
        # if $kmer{$1} has no value, then it will
        # be assigned the value of $i, the position
        # where the k-mer is first found.
        $kmer{$1} = $i;
    }
    $i++;
    $dna = substr($dna, 1, length($dna) - 1);
}

foreach my $kmerkey (keys(%kmer)) {
    print "The first occurrence of string $kmerkey is in position 
 $kmer{$kmerkey}\n"
}
