#!/usr/bin/perl
use warnings FATAL => 'all';
use strict;


# Provide perl code that prints the first 3 characters of all suffixes of a string.

my $line = <>;
chomp $line;

my @string = split(//,$line);
my $number_of_chars = @string;

# professor need use $i = 0 in cs, also out of boundary would cause program stop
# without any error stop code 200 abcdabbcd example
for(my $i = 0; $i<= $number_of_chars; $i ++) {
    
    my @cache = [];
    for (my $j = $i; $j < $number_of_chars; $j ++) {
        
        push(@cache,$string[$j])
            #print($string[$j]);

    }
    
    for ($a = 0; $a < 4 ; $a ++) {
        if (@cache >3) {
            print($cache[$a])
        }
        
    }
    print("\n");
}