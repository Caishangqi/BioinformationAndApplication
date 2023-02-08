#!/pkg/bin/perl -w
#dg
#this reads in a line from a file called testfilenum and tests to see if
#the first line contains a run of numbers. If it does, then it prints that
#run, else it prints a message that the line contains no run. You must
#create the file testfilenum in the same directory that you have this
#program. First put in a line that has a run of digits, run the program,
#then change it so the line does not have a run, and then run the
#program again.

$file = 'testfilenum';
open (INFO, $file);
$line = <INFO>;

if ($line =~ m/(\d+)/)  {
print "The input line does contain a run of digits, and they are $1 \n";
}
else  {
  print "The input line does not contain a run of digits\n";
}
