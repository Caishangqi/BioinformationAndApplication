#perl code and output screenshot for exercises 1.1-1.9

#Exercise 1.1
use warnings;
print "Welcome to Perl\n";
print "TATA is a box\n";
print "\n====================\n";
#remove the first \n in first line
print "Welcome to Perl";
print "TATA is a box\n";
print "\n====================\n";
#second \n also removed
print "Welcome to Perl";
print "TATA is a box";
print "\n====================\n";
#first in but second removed
print "Welcome to Perl\n";
print "TATA is a box";
print "\n====================\n";
#insert \t
print "Welcome\t to Perl\n";
print "TATA is a box\n";
print "\n====================\n";
#insert \t at different location 转义了
print "Welcome\t t\to Pe\trl\n";
print "TA\tTA is a box\n";
print "\n====================\n";
#replace double quote to single quote 没有转义
print 'Welcome\t t\to Pe\trl\n"';
print 'TA\tTA is a box\n';
print '\n====================\n';
#no quote
# print Welcome\t t\to Pe\trl\n;
# print TA\tTA is a box\n;
# print '\n====================\n';
# run fail

# my explanation
# \n is new line
# \t is insert tab
# '' not convert \n and \t which means disable escape character
# "" enable escape character

#Exercise 1.2
print "\n====================\n";
print("When in double quotes:\n");
print("Use \\\\ to output \\\n");
print("Use \\t to output tabs");
print "\n====================\n";

#Exercise 1.3
$dna = 'acCtagGgCCTTAcga';
$dna =~ tr/atcg/ATCG/;
$dna =~ tr/ATCG/UAGC/;
print("$dna \n");
print "\n====================\n";
#Exercise 1.4
$silly = 'tttTTT';
$silly =~ tr/tT/Tt/;
print("$silly\n");
print "\n====================\n";

#Exercise 1.5
$string = 'VRNrIAEelsrrFMVALILdIKrTPgNKPriaemICDIDtYIvEa';
$result = '';
print("$string[1]");
for (my $i = 0; $i <= length($string); $i++) {
    $char = substr($string, $i, 1);
    $char_c = $char;
    #if is a uppercase
    if (($char =~ /[A-Z]/)) {
        $char_c =~ tr/A-Z/a-z/;
    }
    else {
        $char_c =~ tr/a-z/A-Z/;
    }
    $result = $result . $char_c;
}
print("$result \n");
print "\n====================\n";

#Exercise 1.6
my $string = 'SEETQMRLQLKRKLQRNRTSFTQEQIEALEKEFERTHYPDVFARERL';
#enume info
my $A_s = 'ACGPSTWY';
my $E_s = 'RNDQEHK';
my $I_s = 'ILMFV';


# preparing data
my $result = '';
for (my $i = 0; $i <= length($string); $i++) {
    $char = substr($string, $i, 1);
    if ($A_s =~ m[$char]) {
        $result = $result . 'A';
    }
    if ($E_s =~ m[$char]) {
        $result = $result . 'E';
    }
    if ($I_s =~ m[$char]) {
        $result = $result . 'I';
    }
}
print("$result \n");
print "\n====================\n";

#Exercise 1.7
$string3 = $string2 = $string1 = 'albctttpaglkmelkgghtaatctxmljeixjcaelkjxm';
$string1 =~ tr/atcg/X/c;  #除了(c)atcg 外替换成X
$string2 =~ tr/atcg//cd;  #除了(c)atcg 不进行替换并且删除(d)
$string3 =~ tr/atcg/~/cs; #除了(c)atcg 外替换成~并且讲多个 ~压缩成一个~ (s)
print("$string1 \n $string2 \n $string3\n");
print "\n====================\n";

#Exercise 1.8
#program 1 complement DNA sequence
$stringDNA = lc('atCGaTCG');
$stringDNA =~ tr/atcg/tagc/;
#program 2 done a transcription
$stringRNA = $stringDNA;
$stringRNA =~ tr/atcg/uagc/;
print($stringRNA);
print "\n====================\n";

#Exercise 1.9
$stringDNA = lc('atCGaTCG');
$replcount = $stringDNA =~ tr/ag/ag/;
print($replcount);
