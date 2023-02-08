use warnings FATAL => 'all';
#4.1
print("> Input a string:");
$_ = <>;
# ATATAAAGGGA
# ATATGGGA
print("Match TA+GG\n") if (m/TA+GG/);
print("Match TA*GG\n") if (m/TA*GG/);
print("> end of 4.1\n");
# you only need to match 0 times on * but at least 1 on +

#4.2
print("> begin of 4.2\n");
$_ = "TATATAGG";
print("Match (TA)+GG\n") if (m/(TA)+GG/);
print("> end of 4.2\n");
#4.3
print("> begin of 4.3\n");
# simple regex expression of liver motif
print("Match H(T|V|I)EL\n") if (m/H(T|V|I)EL/);
# check whether a string follow any ER motif
$_ = "KDEL";
print("Match (H(T|V|I)EL)|((K|R|H|Q|A)(D|E|N|Q)EL)\n") if (m/(H(T|V|I)EL)|((K|R|H|Q|A)(D|E|N|Q)EL)/);
# how many different motifs are define in (H(T|V|I)EL)|((K|R|H|Q|A)(D|E|N|Q)EL) expression
# 24 + 3 = 27 motifs
print("> end of 4.3\n");
#4.4
print("> begin of 4.4\n");
# code of ser
print("Match TC[TCAG]\n") if (m/TC[TCAG]/);
# code of arginine or ser
print("Match TC[TCAG]|CG[TCAG]\n") if (m/TC[TCAG]|CG[TCAG]/);
print("> end of 4.4\n");
#4.5
print("> begin of 4.5\n");
# CACACACACATTTTCACACACATTT
$varstring = "CACACACACATTTTCACACACACATTTCA\n";
$varstring =~ s/(CA){5}(CA)*/X/g;
print($varstring);
# well, it substitute all CACACA with X, the out-put of this example string should be
# XXXXXTTTTCACACACATTTCA
# the program should not compress consecutive CA into one X
print("> end of 4.5\n");
#4.6
print("> begin of 4.6\n");
# A12345a
# AZ234567
# \s\w\d{5}\s|\s\w{2}\d{6}\s
# \s\w{2}\d{6}\s
$_ = "A12345";
print(Match "bank\n") if (/\s\w\d{5}\s|\s\w{2}\d{6}\s/);
print("> end of 4.6\n");
#4.7

#4.14