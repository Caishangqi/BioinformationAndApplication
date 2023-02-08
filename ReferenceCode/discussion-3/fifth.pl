#Code for regex extensions

$varstring = "IJKL";
#Difference between m/GAT+A/ and m/G(AT)+A/
#Also change to m/G(AT){4}A/
#.- represents any single character except for \n(newline character)
#^- represents negation(not)

if($varstring =~ m/I..L/)
{
		print("Success\n");
}
#.*- any character can repeat 0 or more times.
if($varstring =~ m/I.*L/)
{
		print("Success\n");
}
#character classes: [0-9],[a-z].
if($varstring =~ m/[I-L]/)
{
		print("Success\n");
}
#^- 2 variations, one for negation and one for start of the string
#If you want the second variation, then use '^' for just one character.
if($varstring =~ m/[^A-C][J-L]*/)
{
		print("Success\n");
}
else
{
		print("Failure\n");
}