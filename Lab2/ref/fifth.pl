#Writing to a File

print "Enter the name of the file to read from\n";
$inputfile = <>; #<STDIN>
open infd, "$inputfile";

print "Enter the name of the file to write to\n";
$outputfile = <>;

open outfd, ">$outputfile";

$line1 = <infd>;
$line2 = <infd>;
print outfd "$line1";
print outfd "$line2";

close(infd);
close(outfd);