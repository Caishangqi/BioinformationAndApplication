#Quantified Repetitions

#{i} denotes repetition of the directly preceding regular expression
#{i,j} denotes repetition of the directly preceding regular expression atleast i times and atmost j times. Here i<j
#{i,} denotes repetition of the directly preceding regular expression atleast i times. NO UPPER LIMIT

#[] indicates or for characters inside it. () indicates grouping of characters to occur together

$string1 = "ATATATATATAT";
$string2 = "ATTTTYYYYWWWW";
$string3 = "TAAAATIOIJMWNE";
$string4 = "ATATATATAT";
$string5 = "ATT";

if($string1 =~ m/(AT){6}/)
{
	print "Success1\n";
}

if($string2 =~ m/[AT]{6}/)
{
	print "Success2\n";
}


if($string3 =~ m/[AT]{6}/)
{
	print "Success3\n";
}


if($string4 =~ m/(AT){4,6}/)
{
	print "Success4\n";
}

if($string5 =~ m/[AT]{4,6}/)
{
	print "Success5a\n";
}

if($string5 =~ m/[AT]{3,}/)
{
	print "Success5b\n";
}



