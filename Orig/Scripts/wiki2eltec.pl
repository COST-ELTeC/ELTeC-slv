#!/usr/bin/perl
use warnings;
use utf8;
use FindBin qw($Bin);

$indexFile = shift;
$authorFile = shift;
$inFiles = shift;
$outDir  = shift;

$CNV1 = "$Bin/add-meta-wiki.pl $indexFile $authorFile";
#$CNV2 = "java -jar /usr/local/bin/saxon9he.jar -xsl:$Bin/fix-tags-wiki.xsl";
$CNV2 = "java -jar /home/tomaz/bin/saxon9he.jar -xsl:$Bin/fix-tags-wiki.xsl";
$Schema = "/home/tomaz/Project/COST-Distant/ELTec/Schemas/eltec-1.rng";
$VALIDATE = "java -jar /usr/local/bin/jing.jar $Schema";

foreach $inFile (glob $inFiles) {
    ($signature) = $inFile =~ m|([^/.]+)\.| or die "Can't get sig from $inFile!\n";
    $outFile = "$outDir/$signature.xml";
    print STDERR "INFO: Converting $inFile -> $outFile\n";
    #$status = system("$CNV1 $signature < $inFile > $outFile");
    $status = system("$CNV1 $signature < $inFile | $CNV2 - > $outFile");
    if ($status) {
     	print STDERR "ERROR: Conversion for $inFile failed!\n";
    }
    elsif (system("$VALIDATE $outFile")) {
      print STDERR "ERROR: bad outfile $outFile\n" 
    }
}
