#'?' Operator and Anchors

#'?' operator denotes repetition of the directly preceding regular expression ZERO or ONE times. 
#'?'=> {0,1}
#Anchors specify where the regular expression occurs in the string. The anchors are '^'- denotes the start of the string, and '$'- denotes the end of the string.

$string1 = "AAATAT";
$string2 = "ATTA";
$string3 = "aZ";
$string4 ="";  #What regular expression should I use to match this blank line???


if($string1 =~ m/(A)?/)
{
	print "Success1\n";
}

if($string2 =~ m/[A]?/)
{
	print "Success2\n";
}

if($string3 =~ m/^[a-z][A-Z]$/)
{
	print "Success3a\n";
}

if($string3 =~ m/^[A-Z]+$/)
{
	print "Success3b\n";
}

#=begin
if($string4 =~ m/^$/ )
{
	print "Success4\n";
}
#=cut





