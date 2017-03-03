#! /bin/perl/

# Open file to be processed
$filename=@ARGV[0];

$isopen=open(TXT, "< $filename");

unless($isopen)
{
	die"The File $filename did not open: - ";
}

@lines = <TXT>;
$out=@ARGV[0];
$thefile="";
foreach $line(@lines)
{

	#$line=chomp($line);
	#$line="$line\r\n";
	$thefile.=$line;
}


# Create and open the output file

open(OUT, "> $filename.txt");

# Open Tag Def file

open(TAGDEF, "< tags.def");
@tags=<TAGDEF>;
close(TAGDEF);

# Loop through TAGDEF & make replacements to file
print"processing @ARGV[0] ... ";

foreach $line(@tags)
{
	@rtags=split(/:/, $line);
	$thefile =~s/@rtags[0]/@rtags[1]/gm;
	# print"\n\n@rtags[0]";
}
print "$filename finished.\n\n";
print OUT "$thefile";
close(OUT);
close(TXT);