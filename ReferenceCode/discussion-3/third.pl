#Intro to Regex and Pattern Matching
#String without the characters ".\|()[]{}^$*+?" is a literal string
#The characters above are called meta characters

#To match a regular expression that is a literal string, use the literal string itself


$varstring = "asdfhdskfhbdskfTATAsldkfsdlkfTATA";
#The match operator returns True if the regex(here literal string) is 
#any substring of the string the match operator is bound to.
#m is the match operator
=begin
if($varstring =~  m/TATA/)
{
	print("success\n");
}
=cut
print("success\n") if $varstring =~ m/TATA/;




