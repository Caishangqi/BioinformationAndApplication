#Code to read and print each line of each file whose names are present in another file.
open(IN,'filenames.txt');
#There's a nested while loop in this code
while($file = <IN>)
{
	open(FILE, $file);
	while($line = <FILE>)
	{
		print "$line";
	}
	close(FILE);
}
close(IN);