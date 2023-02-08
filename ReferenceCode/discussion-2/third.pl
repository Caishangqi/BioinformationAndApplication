#DATA in the code itself- instead of typing it in everytime

print "Input a DNA sequence\n";
$_ = <DATA>;   #Gets the first line under __DATA__
chomp;
tr/ATCG/X/;
print;

print "\nInput a protein sequence\n";
$_ = <DATA>;   #Gets the second line under __DATA__
chomp; 
print;
__DATA__
acTGGgact
PRETEIN