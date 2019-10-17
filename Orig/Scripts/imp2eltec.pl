#!/usr/bin/perl
use warnings;
use utf8;
use FindBin qw($Bin);

$indexFile = shift;
$authorFile = shift;
$inFiles = shift;
$outDir  = shift;

$CNV1 = "$Bin/add-meta-imp.pl $indexFile $authorFile";
$CNV2 = "java -jar /usr/local/bin/saxon9he.jar -xsl:$Bin/fix-tags-imp.xsl";
$Schema = "$Bin/../../../Schemas/eltec-1.rng";
$VALIDATE = "java -jar /usr/local/bin/jing.jar $Schema";

foreach $inFile (glob $inFiles) {
    $inFile =~ m|WIKI(\d+)-|;
    $outFile = "$outDir/SLV$1.xml";
    print STDERR "INFO: Converting $inFile -> $outFile\n";
    #$status = system("$CNV1 < $inFile > $outFile"); #For debugging
    $status = system("$CNV1 < $inFile | $CNV2 - > $outFile");
    if ($status) {
	print STDERR "ERROR: Conversion for $inFile failed!\n";
    }
    elsif (system("$VALIDATE $outFile")) {
      die "ERROR: bad outfile $outFile\n" 
    }
}
