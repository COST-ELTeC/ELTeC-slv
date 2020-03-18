#!/usr/bin/perl
use warnings;
use utf8;

$inDir = shift;
$outDir = shift;

use FindBin qw($Bin);
$Saxon = 'java -jar /usr/local/bin/saxon9he.jar';
#$Saxon = 'java -jar /home/tomaz/bin/saxon9he.jar';
$TEXT  = "$Saxon -xsl:$Bin/eltec2text.xsl";

binmode(STDERR,'utf8');

if ($inDir =~ /\.xml/) {$procFiles = $inDir}
elsif (-d $inDir) {$procFiles = "$inDir/*.xml"}

foreach $inFile (glob $procFiles) {
    my $origFile = $inFile;
    ($fName) = $inFile =~ m|([^/]+)\.xml|;
    
    my $outFile = "$outDir/$fName.txt";
    print STDERR "INFO: Converting $fName\n";

    my $status = system("$TEXT $inFile > $outFile");
    if ($status) {
	print STDERR "ERROR: Conversion to text for $inFile failed!\n";
	return 0;
    }
}
