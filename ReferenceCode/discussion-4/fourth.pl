#Example for '$' anchor
#'$' considers the string before the '\n' character. So here if the I/P string is "dna\n", then $ will consider everything before \n.

print "Please enter a string\n";
$string = <STDIN>;

if($string =~ m/^dna$/)
{
		print "Found the match: $string";
}

chomp $string;
print "After chomp: $string";   
print "Last print";