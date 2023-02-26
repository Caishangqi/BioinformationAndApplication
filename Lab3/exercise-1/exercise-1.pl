#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

# 1.2.12
print("> begin of 2.12\n");
$_ = "TTGACAATCGATTTGCATGGCGTGTATATT";
print("Match promoter!\n") if (/TTGACA[ATCG]{18}TATATT/);
print("> end of 2.12\n");

# 1.2.13
print("> begin of 2.13\n");
# TTGACA    TATATT
# TTTACA    TATGTT
$_ = "TTGACAATCGATTTGCATGGCGTGTATATT";
print("Match promoter!\n") if (/TT[GT]ACA[ATCG]{18}TAT[AG]TT/);
print("> end of 2.12\n");
# 1.2.14
print("> begin of 2.14\n");
$_ = "TATAAAACCCCCCCCCCCCCCCCCTTCAAA";
print("Match promoter!\n") if (/TATA[AT]A[AT].{17}[CT][CT]CA[AG][AG]/);
print("> begin of 2.14\n");