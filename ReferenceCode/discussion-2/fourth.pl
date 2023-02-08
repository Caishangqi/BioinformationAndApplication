#Reading From a File


#print "Enter the name of the file to read from\n";
#$filename = <>;
#open fd, "$filename";

#Here I'm assuming the input file is in the same directory as this file.
open(fd, 'myinputfile.txt');    #Remember to give the file format also(here .txt)
$_ = <fd>; #Line 1 read from myinputfile.txt
#chomp;
tr/ATCG/X/;
print;
$_ = <fd>; #Line 2 from myinputfile.txt
#chomp;
print;

close(fd);