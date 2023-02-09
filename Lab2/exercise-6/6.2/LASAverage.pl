use warnings FATAL => 'all';
BEGIN {
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
    sub aveLsc($$) {
        # parameter list
        # file name input
        # number of string
        
        my ($filename, $number_of_strings) = @_;
        my @list = @_;
        #my $filename = $list[0];
        #my $number_of_strings = $list[1];

        #initial value of total is 0
        my $sum = 0;
        my $average = 0;
        my $the_first_line = "";
        open (INPUT, $filename);
        print("(!) open success!\n");
        for(my $init = 0; $init < $number_of_strings; $init++) {
            print("(!) init value is $init\n");
            if ($init == 0) {
                $the_first_line = <INPUT>;
                print("first line is: $the_first_line\n");
            } else {
                my $nextline = <INPUT>;
                print("next line is $nextline\n");
                my $sim_score = lsc($the_first_line,$nextline);
                $sum = $sum + $sim_score;
            }
        }
        $average = $sum / $number_of_strings;
        close(INPUT);
        return($average);
    }
}
open (OUT, "> randomstring.txt");

print "How many nucleotides for the string?\n";
$n = <>;

print("how many random strings to produce?\n");
my $number_of_strings = <>;

$numstring = ''; # start with the empty string;
my $i = 0;
for (my $init = 0; $init < $number_of_strings; $init ++) {
    
    
    while ($i < $n) {


        $numstring = int(rand(4)) . $numstring; # generate a new random integer
        # between 0 and 3, and concatenate
        # it with the existing $numstring,
        # assigning the result to $numstring.
        $i++;                                   # increase the value of $i by one.
    }

    $dnastring = $numstring;                  # unneeded, but good for clarity.
    $dnastring =~ tr/0123/actg/; # translate the numbers to DNA characters.
    print OUT "$dnastring\n";
    #
    $i = 0;
    $numstring = '';
    #
}
close (OUT);
print("Phase1 Done!\n");
print aveLsc("randomstring.txt",$number_of_strings);

# conclusion
# question 1: 2.64 average
# question 2: 20-> 6.02 average, 50-> 16.78 average, 100-> 35.85 average, 200-> 75.36 average

