#!/usr/bin/perl
use warnings;
use utf8;

$inDir = shift;
$outDir = shift;

use FindBin qw($Bin);
`mkdir $outDir` unless -e "$outDir";

#$UD  = "totalepa.pl -a lem";
$UD  = "totalepa.pl -a dep";

binmode(STDERR,'utf8');

if ($inDir =~ /\.txt/) {$procFiles = $inDir}
elsif (-d $inDir) {$procFiles = "$inDir/*.txt"}

foreach $inFile (glob $procFiles) {
    my $origFile = $inFile;
    ($fName) = $inFile =~ m|([^/]+)\.txt|;
    
    my $outFile = "$outDir/$fName.conllu";
    print STDERR "INFO: Converting $fName\n";

    my $status = system("$UD < $inFile > $outFile");
    if ($status) {
	print STDERR "ERROR: Annotation for $inFile failed!\n";
    }
}
