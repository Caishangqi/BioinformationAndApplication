#While loop to read all lines of a file

#Writing to a File

print "Enter the name of the file to read from\n";
$inputfile = <>;
open infd, "$inputfile";

print "Enter the name of the file to write to\n";
$outputfile = <>;

open outfd, ">$outputfile";

while($line = <infd>) #While there is a line to read from the input file
{
		$line =~ tr/ATCG/X/;
		print outfd "$line";
}
close(infd);
close(outfd);

use strict;
my @arr = (
	{ name => "aaa" , values => ["a1","a2"] },
	{ name => "bbb" , values => ["b1","b2","b3"] }
);


foreach $a (@arr) {
	my @cur_values = @{$a->{values}};
	print("values of $a->{name}: ");
	foreach $b (@cur_values){
		print $b . ", "
	}
	print "\n";
};