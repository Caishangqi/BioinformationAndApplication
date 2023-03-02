#!/usr/bin/perl
use warnings FATAL => 'deprecated';
use strict;

sub findKmer {
    my @param_list = @_;
    my $dna = $param_list[0];
    chomp $dna;

    my $k = 4;

    my %kmer = ();
    my $i = 1;

    while (length($dna) >= $k) {
        $dna =~ m/(.{$k})/;
        if (!defined $kmer{$1}) {
            $kmer{$1} = [ $i ];
        }
        else {
            push(@{$kmer{$1}}, $i)
        }
        $i++;
        $dna = substr($dna, 1, length($dna) - 1);
    }

    # foreach my $kmerkey (sort keys(%kmer)) {
    #     my $occrs = join(', ', @{$kmer{$kmerkey}});
    #     print "The occurrences of string $kmerkey are in positions $occrs \n";
    # }

    return %kmer;
}

# it should return the length of match
sub scanString {

    # scanString(str1, str1pos, str2, str2pos)

    my @param_list = @_;
    # 0 th parameter is for first string input
    my $first_string = $param_list[0];
    my @first_string_location = $param_list[1];

    # 2 th parameter is for second string input
    my $second_string = $param_list[2];
    my @second_string_location = $param_list[3];

    # turn them ito array
    my @string_first_array = split(//, $first_string);
    my $first_string_length = @string_first_array;
    my @string_second_array = split(//, $second_string);
    my $second_string_length = @string_second_array;

    my $total_match = 4; # default 4-kmer value


    my $length_bound = $first_string_length;          # 38
    my $length_bound_pos = $first_string_location[0]; #29
    if ($first_string_length >= $second_string_length) {
        $length_bound = $second_string_length;          # 60
        $length_bound_pos = $second_string_location[0]; # 12
    }

    #print("Debug: $param_list[1]\n"); # 6
    #print("Debug: $param_list[3]\n"); # 15


    # now we first scan left
    for (my $current_pointer_shift = 1; $current_pointer_shift <= $length_bound_pos; $current_pointer_shift++) {
        #print("Debug: First left on string 1: @string_first_array[$first_string_location[0] - $current_pointer_shift - 1]\n");
        #print("Debug: First left on string 2: @string_second_array[$second_string_location[0] - $current_pointer_shift - 1]\n");
        if (@string_first_array[$first_string_location[0] - $current_pointer_shift - 1] eq @string_second_array[$second_string_location[0] - $current_pointer_shift - 1]) {

            $total_match++;
        }
        else {
            last;
        }
    }

    # the we scan right
    for (my $current_pointer_shift = 4; $current_pointer_shift <= $length_bound - $length_bound_pos; $current_pointer_shift++) {
        #print("Debug: First right on string 1: @string_first_array[$first_string_location[0] + $current_pointer_shift - 1]\n");
        #print("Debug: First right on string 2: @string_second_array[$second_string_location[0] + $current_pointer_shift - 1]\n");
        if (@string_first_array[$first_string_location[0] + $current_pointer_shift - 1] eq @string_second_array[$second_string_location[0] + $current_pointer_shift - 1]) {
            $total_match++;
        }
        else {
            last;
        }
    }

    return ($total_match)
}
sub scanStringReturnString {

    # scanString(str1, str1pos, str2, str2pos)

    my @param_list = @_;
    # 0 th parameter is for first string input
    my $first_string = $param_list[0];
    my @first_string_location = $param_list[1];

    # 2 th parameter is for second string input
    my $second_string = $param_list[2];
    my @second_string_location = $param_list[3];

    # turn them ito array
    my @string_first_array = split(//, $first_string);
    my $first_string_length = @string_first_array;
    my @string_second_array = split(//, $second_string);
    my $second_string_length = @string_second_array;

    my $total_match = 4; # default 4-kmer value
    my $kmer = $param_list[4];

    my $length_bound = $first_string_length;          # 38
    my $length_bound_pos = $first_string_location[0]; #29
    if ($first_string_length >= $second_string_length) {
        $length_bound = $second_string_length;          # 60
        $length_bound_pos = $second_string_location[0]; # 12
    }

    #print("Debug: $param_list[1]\n"); # 6
    #print("Debug: $param_list[3]\n"); # 15

    my $left_string = "";
    my $right_string = "";
    my $final_concat_string = "";

    # now we first scan left
    for (my $current_pointer_shift = 1; $current_pointer_shift <= $length_bound_pos; $current_pointer_shift++) {
        #print("Debug: First left on string 1: @string_first_array[$first_string_location[0] - $current_pointer_shift - 1]\n");
        #print("Debug: First left on string 2: @string_second_array[$second_string_location[0] - $current_pointer_shift - 1]\n");
        if (@string_first_array[$first_string_location[0] - $current_pointer_shift - 1] eq @string_second_array[$second_string_location[0] - $current_pointer_shift - 1]) {

            $total_match++;
            $left_string .= @string_first_array[$first_string_location[0] - $current_pointer_shift - 1];

        }
        else {
            last;
        }
    }
    $left_string = scalar reverse("$left_string");

    # the we scan right
    for (my $current_pointer_shift = 4; $current_pointer_shift <= $length_bound - $length_bound_pos; $current_pointer_shift++) {
        #print("Debug: First right on string 1: @string_first_array[$first_string_location[0] + $current_pointer_shift - 1]\n");
        #print("Debug: First right on string 2: @string_second_array[$second_string_location[0] + $current_pointer_shift - 1]\n");
        if (@string_first_array[$first_string_location[0] + $current_pointer_shift - 1] eq @string_second_array[$second_string_location[0] + $current_pointer_shift - 1]) {
            $total_match++;
            $right_string .= @string_first_array[$first_string_location[0] + $current_pointer_shift - 1];
        }
        else {
            last;
        }
    }

    $final_concat_string = $left_string . $kmer . $right_string;

    return [ $total_match, $final_concat_string ]
}
sub hashTableToString {
    my $hash = shift;
    foreach my $key (keys %{$hash}) {
        my $res;
        for (@{$hash->{$key}}) {
            my $str = join(', ', @{$_});
            $res .= "[ $str ]";
        }
        print "$key: [ $res ]\n";
    }
}
open _FileQ, "Q.txt";
open _FileS, "S.txt";

my $query_Q = <_FileQ>;
# my $string_S = <S>;
# my %hash_table_Q_kmers = findKmerWithFirstLocation($query_Q); # ther, 33
# my %hash_table_S_kmers = findKmerWithFirstLocation($string_S);

# INITIALIZE HASH TABLE #
# data structure of hash table
# kmers => { s3:loc7                   }

# storage all S lines in to a list
# all S data in a list
my @data_s;
my $threshold = 6;
my $kmer = 4;

# mkvlwaallvtflagcqakveqavetepepelrqqtewqsgqrwelalgrfwdylrwvqt
#     lseqvqeellssqvtqelralmdetmkelkaykseleeqltpvaeetrarlskelqaaqa
#         rlgadvlashgrlvqyrgevqamlgqsteelrvrlashlrklrkrllrvlashqkrlavy
#             qagaregaerglsairerlgplveqgrvraatvgslagqplqeraqawgerlrarmeemg
#                 srtrdrldevkeqvaevrakleeqaqqirlvlashqarlkswfeplvedmqrqwaglvek

while (my $line = <_FileS>) {
    push(@data_s, $line)
}

# hash table build
my %hash_table;

for my $i (0 .. $#data_s) {
    # key: [...int]
    # lash: [7, 35, 50]
    my %kmers = findKmer($data_s[$i]);

    while ((my $key, my $value) = each(%kmers)) {
        for (@{$value}) {
            if (!defined $hash_table{$key}) {
                $hash_table{$key} = [ [ $i, $_ ] ];
            }
            else {
                push(@{$hash_table{$key}}, [ $i, $_ ]);
            }
        }
    }
}

hashTableToString(\%hash_table);

# 模板 
# foreach my $key (keys %hash_table) {
#     # ARRAY(0xffff) ARRAY(0xffff)
#     # OR
#     # ARRAY(0xffff)
# 
#     # print "@{@{$hash_table{$key}}[0]} \n";
#     my @res;
#     for (@{$hash_table{$key}}) {
#         my @arr = @{$_};
#         push(@res, "[$arr[0], $arr[1]]");
#     }
#     print "$key " . join(", ", @res) . "\n";
#     # print "@{$hash_table{$key}}\n"
# }

#hashTableToString(%hash_table);

# hash table build complete!

my $all_S_in_line = "";
# all S in one line
foreach my $data_s (@data_s) {
    $data_s =~ chomp $data_s;
    $all_S_in_line = $all_S_in_line . $data_s
}

# 每当 S 中的 4-mer 被确定为在 Q 中时，提取该 4-mer 在 Q 中第一次出现的位置。
my @final_result;
foreach my $hashTableKey (keys(%hash_table)) {
    $query_Q =~ m/($hashTableKey)/;
    if (defined $1) {
        my $first_location_in_Q = index($query_Q, $1) + 1;
        #print("$1, located Q at: $first_location_in_Q\n");
        # find this kmer correspond location value on S hash table
        # kmer=> [2,7,35,50] , [4,32]

        my $length_of_location_array = @{$hash_table{$1}};
        #print("length of location array = $length_of_location_array\n");

        # iteration inside of the value of hash
        # [ [ 2, 7 ][ 2, 35 ][ 2, 50 ][ 4, 32 ] ]

        foreach my $single_value (@{$hash_table{$1}}) {
            # scanString(str1, str1pos, str2, str2pos)
            my $max = scanStringReturnString(@data_s[@{$single_value}[0]], @{$single_value}[1], $query_Q, $first_location_in_Q, $1);
            if (@{$max}[0] >= $threshold) {

                print("(+) good HSP has been found with seed = $1 at S = @{$single_value}[0], location = @{$single_value}[1]\n");
                print("(+) Actual length of HSP is @{$max}[0] \n");

                #print @{$max}[1] ~~ @final_result;
                my $cache = @{$max}[1];
                # print("$cache\n");
                if ($cache ~~ @final_result) {

                }
                else {
                    push(@final_result, @{$max}[1]);
                    # print("PUSHED!\n")
                }
                # 
                # print("(!) @{$max}[1]\n");

            }
            # print( . "," . @{$single_value}[1], "\n");
            #print("$max\n")
        }

    }

}

foreach my $single_value (@final_result) {
    print("FINAL RESULT IS: $single_value\n");
}


# Then put the characters of Q and S in arrays (as we did in needleman.pl) so
# that you can examine individual characters.

#split up the line into individual characters

# Then scan left from the k-mer in Q and in S, as long
# as you find matching characters. Repeat to the right. Let L denote the length of the whole match
# obtained in this way. If L is greater than 10, then print a message that a good HSP has been
# found between Q and S, and print S. Notice that the same HSP gets reported multiple times.
# Explain why that happens.

# scanString(str1, str1pos, str2, str2pos)
# arg0 = "", arg1 = int , arg2 = "", arg3 = "", arg4 = int, arg5 = ""

# print(scanString($query_Q, @location_Q, $string_S, @location_S));

close(_FileQ);
close(_FileS);