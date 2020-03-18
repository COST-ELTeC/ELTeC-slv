#!/usr/bin/perl
use warnings;
use utf8;

$inDir = shift;
$outDir = shift;

use FindBin qw($Bin);
use File::Temp qw/ tempfile tempdir /;  #creation of tmp files and directory
`mkdir $Bin/tmp` unless -e "$Bin/tmp";
$tmpDir="$Bin/tmp";
my $tempDir = tempdir(DIR => $tmpDir, CLEANUP => 1);

$NER  = "python $Bin/janes-ner/tagger.py sl";
$inExt = 'conllu';
$outExt = 'conllu.ner';

binmode(STDERR,'utf8');

if ($inDir =~ /\.$inExt/) {$procFiles = $inDir}
elsif (-d $inDir) {$procFiles = "$inDir/*.$inExt"}

foreach $inFile (glob $procFiles) {
    ($fName) = $inFile =~ m|([^/]+)\.$inExt|
	or die "Cannot find filename in $inFile!\n";
    
    my $outFile = "$outDir/$fName.$outExt";
    print STDERR "INFO: Converting $fName\n";

    $tmpFile1 = "$tempDir/$fName-in.ner";
    $tmpFile2 = "$tempDir/$fName-out.ner";
    
    open(IN,  '<:utf8', $inFile) or die "No input file $inFile!\n";
    open(OUT, '>:utf8', $tmpFile1) or die;
    my @in = ();
    my $empty;
    while (<IN>) {
	chomp;
	push(@in, $_);
	if (/^#/) {}
	elsif (/\t/) {
	    my ($n, $token, $lemma, $upos, $xpos, $ufeats, $link, $role, $extra, $local) 
		= split /\t/;
	    print OUT "$token\t$xpos\n";
	    $empty = 0;
	}
	else {
	    print OUT "\n" unless $empty;
	    $empty = 1;
	}
    }
    close IN;
    close OUT;
    
    my $status = system("$NER < $tmpFile1 > $tmpFile2");
    if ($status) {
	print STDERR "ERROR: Annotation for $inFile failed!\n";
    }

    open(IN,  '<:utf8', $tmpFile2) or die "Can't open input $inFile\n";
    open(OUT, '>:utf8', $outFile) or die "Can't open output $outFile\n";
    my $label_prev = 'O';
    foreach $in (@in) {
	if ($in !~ /\t/) {
	    if ($label_prev ne 'O') {
		print OUT "</name>\n";
		$label_prev = 'O';
	    }
	    print OUT "$in\n";
	    next
	}
	my $ner = <IN>;
	chomp $ner;
	if (not $ner) {
	    if ($label_prev ne 'O') {
		print OUT "</name>\n";
		$label_prev = 'O';
	    }
	    $ner = <IN>;
	    chomp $ner;
	}
	my ($n, $token, $lemma, $upos, $xpos, $ufeats, $link, $role, $extra, $local) 
	    = split(/\t/, $in);
	my ($token_ner, $xpos_ner, $label_ner) 
	    = split(/\t/, $ner);
	die "Token mismatch: $token vs. $token_ner\n"
	    unless $token eq $token_ner;
	if ($label_prev eq 'O') {
	    if ($label_ner =~ /^[BI]-(.+)/) {
		print OUT "<name type=\"$1\">\n";
	    }
	}
	else {
	    if ($label_ner =~ /^[OB]/) {
		print OUT "</name>\n";
	    }
	    if ($label_ner =~ /^B-(.+)/) {
		print OUT "<name type=\"$1\">\n";
	    }
	}
	$label_prev = $label_ner;
	print OUT "$in\n";
    }
    close IN;
    close OUT;
}
