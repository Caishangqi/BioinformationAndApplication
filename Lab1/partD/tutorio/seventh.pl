#Intro to regular expressions

#Literal strings- strings without meta characters '.''\''('')''['']''{''}''^''$''*''+''?'

$varstring = "TATAghjasgdasTATA";
$idstring =  "\@abcde";
$protstring = "AGTCGCTGCGTCG";

if($varstring =~ m/TATA/)					#m is the match operator which returns true if a match was found in the string, else false
{
		print "match found\n";
}


if($idstring =~ m/^@/)    #^ denotes the start of the string and $ denotes the end of the string
{
		print "This is an id string in FASTQ format\n";
}


if($protstring =~ m/^[ATGC]+$/)
{
		print "This is an protein string\n";
}


