use warnings;
print "Enter the name of the file to read from\n";
# test only
# $inputfile = 'sample.fasta'; #<STDIN>
$inputfile = <>; #<STDIN>
open infd, "$inputfile";

print "Enter the dummy score to use\n";
# test only
# $inputfile = 'sample.fasta'; #<STDIN>
$dummyScore = <>; #<STDIN>

print "Enter the name of the file to write to\n";
# test only
# $outputfile = 'sample_reverse.fastq';
$outputfile = <>;
open outfd, ">$outputfile";


while($line = <infd>) 
{   
    if (">" eq substr($line, 0, 1)) {
        
        $scoreLine = $line;
        substr($scoreLine, 0, 1, "+");
        
        substr($line, 0, 1, "@");
        print outfd "$line";
        
        $line = <infd>;
        print outfd "$line";
        print outfd "$scoreLine";
        $countNumber = length($line);
        $dummything = $dummyScore x ($countNumber-1);
        print outfd "$dummything +\n";
    }

}
# close stream
close(infd);
close(outfd);
