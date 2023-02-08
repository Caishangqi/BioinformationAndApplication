print "HelloWorld \n";

$string1 = 'abcdEFGHijklmNOPQrstuVWXYZ';
print "$string1 \n";
$replcount = $string1 =~ tr/a-z/A-Z/;
print "$string1 \n $replcount \n";
print $string1 = ~tr/a-z/A-Z/;
