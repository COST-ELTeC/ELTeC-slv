#!/usr/bin/perl
use warnings;
use utf8;
use FindBin qw($Bin);

$indexFile = shift;
$inFiles = shift;
$outDir  = shift;

$CNV1 = "$Bin/add-meta-imp.pl $indexFile";
$CNV2 = "java -jar /usr/local/bin/saxon9he.jar -xsl:$Bin/fix-tags-imp.xsl";
#$Schema = "https://distantreading.github.io/Schema/eltec-1.rng";
$Schema = "/home/tomaz/Project/COST-Distant/ELTec/Schemas/eltec-1.rng";
$VALIDATE = "java -jar /usr/local/bin/jing.jar $Schema";

foreach $inFile (glob $inFiles) {
    $inFile =~ m|([^/.]+)\.|;
    #$outFile = "$outDir/SL-$1.xml";
    $outFile = "$outDir/SLV-$1.xml";
    $outFile =~ s/-WIKI//;
    print STDERR "INFO: Converting $inFile -> $outFile\n";
    $status = system("$CNV1 < $inFile | $CNV2 - > $outFile");
    if ($status) {
	print STDERR "ERROR: Conversion for $inFile failed!\n";
    }
    elsif (system("$VALIDATE $outFile")) {
      print STDERR "ERROR: bad outfile $outFile\n" 
    }
}
