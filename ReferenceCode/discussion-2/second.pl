#Defaults in I/O

print "Enter a DNA string where case matters, and hit return\n";

$_ = <>; # instead of $text = <STDIN>; Perl's default assumption is STDIN
#$_ is the input special variable
chomp ;  # instead of chomp $text;

tr/ATCG/X/; #instead of $count = $text =~ tr/ATCG/X/;
print;

#Perl uses the value in $_ variable if no variable is given as argument 