#Code to see the role of parantheses in regular expressions

$varstring = "GATATATATA";
#Difference between m/GAT+A/ and m/G(AT)+A/
#Also change to m/G(AT){4}A/

#GATTTTTA
#GATA
#GATATATATA

if($varstring =~ m/G(AT){4}A/)
{
		print("Success\n");
}
else
{
		print("Failure\n");
}
