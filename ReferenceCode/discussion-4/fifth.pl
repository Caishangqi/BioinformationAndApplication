#Split function and for loops
#Split syntax: split /regex/,Expression, Limit
#Split returns a list of fields that have been split based on the regex specified.


$string = "This!!Is!!ECS!!124";

@list1 = split('!!',$string); #split(regex,expression)   
#@ is how you start a list/array

@list4 = (1,2,3,4);



$list_size = @list1;

print("$list_size\n");

foreach $word (@list1)
{
	print "$word\n";
}

for($i=0; $i < $list_size; $i++)
{
	print "$list1[$i]\n";
}

@list2 = split('!!',$string,2); #split(regex,expression,limit)

foreach $word (@list2)
{
	print "$word\n";
}


@list3 = split(//,$string);   #What does this do???


foreach $word (@list3)
{
	print "$word\n";		#What output will this return
}

