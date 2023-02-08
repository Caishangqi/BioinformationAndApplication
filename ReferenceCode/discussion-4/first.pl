#More Character Classes and their Negations
#\w represents the word character class which is [a-zA-z0-9] i.e lowercase alphabets, uppercase alphabets and digits
#The negation of \w is \W=>[^a-zA-z0-9] . The negation of \d([0-9]) is \D.
#\s is the space character class. It includes whatever can come after a word - [ \n\r\f\t]: \r is carriage return and \f is form feed which tells the printer that it is a new page
#The negation of \s is \S=>[^ \n\r\f\t]

$varstring1 = "abcdefg";
$varstring2 =  1234;
$varstring3 = "ABCDEFG";
$varstring4 = "\!\@\#\$";    #Why would this cause a syntax error
$varstring5 = "     ";

#=begin
if($varstring1 =~ m/\w/)
{
		print("Success1\n");
}
#=cut

#=begin
if($varstring1 =~ m/\D/)
{
		print("Success1b\n");
}
#=cut

if($varstring2 =~ m/\w/)
{
		print("Success2\n");
}

if($varstring3 =~ m/\w/)
{
		print("Success3\n");
}

#=begin
if($varstring4 =~ m/\W/)
{
		print("Success4\n");
}
#=cut

#=begin
if($varstring5 =~ m/\s/)
{
		print("Success5\n");
}
#=cut

#=begin
if($varstring1 =~ m/\S/)
{
		print("Success1c\n");
}
#=cut




