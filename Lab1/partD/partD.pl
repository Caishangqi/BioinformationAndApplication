print "Enter the name of the file to read from\n";
# test only
# $inputfile = 'sample.fastq'; #<STDIN>
$inputfile = 'sample.fastq'; #<STDIN>
open infd, "$inputfile";

print "Enter the name of the file to write to\n";
# test only
# $outputfile = 'sample.fasta';
$outputfile = 'sample.fasta';
open outfd, ">$outputfile";

while($line = <infd>) #
{
    if ("@" eq substr($line, 0, 1)) {
        substr($line, 0, 1, ">");
        print outfd "$line";
        $line = <infd>;
        print outfd "$line"; # next line of behind @
    }

    if ("+" eq substr($line, 0, 1)) {
        seek(infd,1,1); #jump the score part, seek is bad can be replace just next line used in next part
        next; # go to the next cycle
    }

    
    
}
# close stream
close(infd);
close(outfd);