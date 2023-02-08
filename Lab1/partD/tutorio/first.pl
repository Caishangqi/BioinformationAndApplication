#I/O operations


print "Enter a DNA string where case matters, and hit return\n";
$text1 = <STDIN>; 
#A single line of text is read when the Perl interpreter encounters '<' and '>' together
$text2 = "ATCGSjjsad";

print "$text1";
print "$text2";


chomp $text1;
#eq does the literal string comparison but == does not.
if($text1 eq $text2)
{
	print "same";
}
#$text2 = <STDIN>;
#STDIN- Standard Input - Keyboard in this case
#chomp $text;		#Why do we need this? Try doing it without this
print "The original sequence is $text";

#chomp - remove the newline character(only at the end)
#chop - remove the last character in the string.(any character)

$count = $text1 =~ tr/ATCG/X/;
print "There are $count capital characters in the original sequence. The sequence after translation is $text1\n";


#ATCGSDasdasd\n