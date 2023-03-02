#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
sub findKmerWithFirstLocation {
    my @param_list = @_;
    my $dna = $param_list[0];
    # print "string is $dna\n";
    chomp $dna;
    my $k = 4;
    chomp $k;
    my %kmer = (); # This initializes the hash called kmer.
    my %fixed_kmer = ();
    my $i = 1;
    while (length($dna) >= $k) {
        $dna =~ m/(.{$k})/;
        #print "$1, $i \n";
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

        $kmerkey =~ s/\s+$//;
        # remove not 4-kmer element
        if (length($kmerkey) == 4) {
            $fixed_kmer{$kmerkey} = $kmer{$kmerkey};
            my $l = length($kmerkey);
            print("($kmerkey,$fixed_kmer{$kmerkey})\n");
        }

    }

    return (%fixed_kmer)
}

findKmerWithFirstLocation("rlgadvlashgrlvqyrgevqamlgqsteelrvrlashlrklrkrllrvlashqkrlavy")