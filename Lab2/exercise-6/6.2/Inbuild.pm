#!/pkg/bin/perl -w
#This is the Needleman-Wunsch global alignment algorithm without gaps 
#in the model and
#with match value = 1, and mismatch and indel value = -1.
#dg
use warnings FATAL => 'all';

package Inbuild;

sub lsc {
    my @list = @_;
    my $first_line = $list[0];
    chomp($first_line);
    my @string1 = split(//, $first_line);
    my $n = @string1;

    my $second_line = $list[1];
    chomp($second_line);
    my @string2 = split(//, $second_line);
    my $m = @string2;

    print "The lengths of the two strings are $n, $m \n"; # Just to make sure this works.
    

    $V[0][0] = 0; # Assign the 0,0 entry of the V matrix

    for ($i = 1; $i <= $n; $i++) {
        # Assign the column 0  values and print 
        # String 1  See section 5.2 of Johnson
        # for loops
        $V[$i][0] = -$i;
        # print OUT "$string1[$i - 1]"; # Note the -1 here because array indexes start at 0 (ug!)
    }
    # print OUT "\n\n";

    for ($j = 1; $j <= $m; $j++) {
        # Assign the row 0 values and print String 2
        $V[0][$j] = -$j;
        # print OUT "$string2[$j - 1]";
    }

    for ($i = 1; $i <= $n; $i++) { # follow the recurrences to fill in the V matrix.
        for ($j = 1; $j <= $m; $j++) {
            #   print OUT "$string1[$i-1], $string2[$j-1]\n"; # This is here  for debugging purposes.
            if ($string1[$i - 1] eq $string2[$j - 1]) {
                $t = 1;}
            else {
                # modification
                $t = 0;
                # end of modification
            }

            $max = $V[$i - 1][$j - 1] + $t;
            #  print OUT "For $i, $j, t is $t \n"; # Another debugging line.
            if ($max < $V[$i][$j - 1] - 1) {
                $max = $V[$i][$j - 1] - 1;
            }

            if ($V[$i - 1][$j] - 1 > $max) {
                $max = $V[$i - 1][$j] - 1;
            }
            $V[$i][$j] = $max;
            # print OUT "V[$i][$j] has value $V[$i][$j]\n";
        }
    }
    return $V[$n][$m];
}

1;