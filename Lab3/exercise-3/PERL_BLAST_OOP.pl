#!/usr/bin/perl
# use strict;
use warnings FATAL => 'deprecated';
use strict;


package record;
sub new {
    my $class = shift;
    my $self = {
        _stringID         => shift,
        _locationInString => shift,
    };
    # 输出用户信息
    print "stringID: $self->{_stringID}\n";
    print "locationInString: $self->{_locationInString}\n";
    bless $self, $class;
    return $self;
}
sub setStringID {
    my ($self, $stringID) = @_;
    $self->{_stringID} = $stringID if defined($stringID);
    return $self->{_stringID};
}

sub getStringID {
    my ($self) = @_;
    return $self->{_stringID};
}

sub setLocationInString {
    my ($self, $location) = @_;
    $self->{_locationInString} = $location if defined($location);
    return $self->{_locationInStringD};
}

sub getLocationInString {
    my ($self) = @_;
    return $self->{_locationInString};
}
1;

sub findKmerWithFirstLocation {
    my @param_list = @_;
    my $dna = $param_list[0];
    print "string is $dna\n";
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
            #print("length = $l $kmerkey\n");
        }

    }

    return (%fixed_kmer)

}

# it should return the length of match
sub scanString {

    # scanString(str1, str1pos, str2, str2pos)

    my @param_list = @_;
    # 0 th parameter is for first string input
    my $first_string = $param_list[0];
    my @first_string_location = $param_list[1];

    # 2 th parameter is for second string input
    my $second_string = $param_list[3];
    my @second_string_location = $param_list[4];

    # turn them ito array
    my @string_first_array = split(//, $first_string);
    my $first_string_length = scalar(@string_first_array);
    my @string_second_array = split(//, $second_string);
    my $second_string_length = scalar(@string_second_array);

    my $total_match = 4; # default 4-kmer value


    my $length_bound = $first_string_length;          # 38
    my $length_bound_pos = $first_string_location[0]; #29
    if ($first_string_length >= $second_string_length) {
        $length_bound = $second_string_length;          # 60
        $length_bound_pos = $second_string_location[0]; # 12
    }

    print("Debug: $param_list[0]\n");
    print("Debug: $param_list[3]\n");


    # now we first scan left
    for (my $current_pointer_shift = 1; $current_pointer_shift <= $length_bound_pos; $current_pointer_shift++) {
        if (@string_first_array[$first_string_location[0] - $current_pointer_shift] eq $second_string_location[0] - $current_pointer_shift) {
            $total_match++;
        }
        else {
            last;
        }
    }

    # the we scan right
    for (my $current_pointer_shift = 4; $current_pointer_shift <= $length_bound - $length_bound_pos; $current_pointer_shift++) {
        if (@string_first_array[$first_string_location[0] + $current_pointer_shift] eq $second_string_location[0] + $current_pointer_shift) {
            $total_match++;
        }
        else {
            last;
        }
    }

    return ($total_match)
}

open Q, "Q.txt";
open S, "S.txt";

my $query_Q = <Q>;
# my $string_S = <S>;
# my %hash_table_Q_kmers = findKmerWithFirstLocation($query_Q); # ther, 33
# my %hash_table_S_kmers = findKmerWithFirstLocation($string_S);

# INITIALIZE HASH TABLE #
# data structure of hash table
# kmers => { s3:loc7                   }

# storage all S lines in to a list
# all S data in a list
my @all_S_data;

# mkvlwaallvtflagcqakveqavetepepelrqqtewqsgqrwelalgrfwdylrwvqt
#     lseqvqeellssqvtqelralmdetmkelkaykseleeqltpvaeetrarlskelqaaqa
#         rlgadvlashgrlvqyrgevqamlgqsteelrvrlashlrklrkrllrvlashqkrlavy
#             qagaregaerglsairerlgplveqgrvraatvgslagqplqeraqawgerlrarmeemg
#                 srtrdrldevkeqvaevrakleeqaqqirlvlashqarlkswfeplvedmqrqwaglvek

while (my $line = <S>) {
    push(@all_S_data, $line)
}

my %hash_table;

for (my $i = 0; $i < scalar(@all_S_data); $i++) {
    my %kmers_with_location = findKmerWithFirstLocation($all_S_data[$i]); # ther, 33

    foreach my $kmer_key (keys(%kmers_with_location)) {
        print("DEBUG: $kmer_key + $kmers_with_location{$kmer_key}\n");
        # if the hash table already have the kmer
        if (exists($hash_table{$kmer_key})) {
            print("this kmer $kmer_key exist in hashtable so added to the kmer key~\n");

            my @cache_list = \$hash_table{$kmer_key};
            my $index = length(@cache_list);

            my $record = new record($i, $kmers_with_location{$kmer_key});

            my $index_after = length(@cache_list);
            #$cache_list[$index] = $record;
            push(@cache_list, $record);
            #$hash_table{$kmer_key}->[$index] = $record;

            print("==========================================================\n");
            print("The multiple value in hash is: $hash_table{$kmer_key}\n");
            print("right now hash table length is: BEFORE: $index, AFTER: $index_after\n");
            print("==========================================================\n");

        }
        else {
            my @cache_array = ();
            my $record = new record($i, $kmers_with_location{$kmer_key});
            $cache_array[0] = $record; #[record]


            #push(@cache_array,$record);
            $hash_table{$kmer_key} = \@cache_array;
            print("DEBUG: current cache_array =  $cache_array[0]\n");

            print("DEBUG: hashtable value =  $hash_table{$kmer_key}\n");
            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");
            @cache_array = $hash_table{$kmer_key};
            my $index = length(@cache_array);
            print("right now hash table length is: $index\n");
            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");

            undef @cache_array;
            undef $record;

        }

    }

}

# print the hashtable

# key: [record1,record2],
# key: []

foreach my $kmer_key (keys(%hash_table)) {
    print("$kmer_key => ");

    my @cache_list = \$hash_table{$kmer_key};

    # my $record = $cache_list[0];
    # print($record->record::getStringID);

    for (my $i = 0; $i < length(@cache_list); $i++) {
        my @array = $hash_table{$kmer_key};
        my $record = $array[$i];
        print("DEBUG: record in print section is: $record\n");
        print($record->record::getStringID . " " . $record->record::getLocationInString);
    }

    # for my $records (\@cache_list) {
    #     if ($records != "") {
    #         print($records->record::getStringID, $records->record::getLocationInString)
    #     }
    #     
    # }

    print("\n")

}


# 每当 S 中的 4-mer 被确定为在 Q 中时，提取该 4-mer 在 Q 中第一次出现的位置。

# my @location_Q;
# my @location_S;
# foreach my $kmer_key (keys(%hash_table_S_kmers)) {
#     if (exists($hash_table_Q_kmers{$kmer_key})) {
# 
#         @location_Q = ($hash_table_Q_kmers{$kmer_key}, $kmer_key);
#         @location_S = ($hash_table_S_kmers{$kmer_key}, $kmer_key);
# 
#     }
# }
# 
# print("@location_Q\n");
# print("===========\n");
# print("@location_S\n");

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
close(Q);
close(S);