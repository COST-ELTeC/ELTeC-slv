#!/usr/bin/perl
use warnings;
use utf8;
use URI::Escape;
use LWP::Simple;
use FindBin qw($Bin);
use File::Temp qw/ tempfile tempdir /;  #creation of tmp files and directory
$tmpDir="$Bin/tmp";
my $tempDir = tempdir(DIR => $tmpDir, CLEANUP => 0);

$getVIAF = "java -jar /usr/local/bin/saxon9he.jar -xsl:$Bin/viaf2id.xsl";
binmode STDERR, 'utf8';
binmode STDIN,  'utf8';
binmode STDOUT, 'utf8';

$URL = 'http://www.viaf.org/viaf/search?query=cql.any+=+local.names+all+"XXX"&httpAccept=application/xml';
while (<>) {
    next if /Kanoničnost/;
    chomp;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $digitised, $period, $words, $canon, 
	$reprints, $imp_id) =
	    split /\t/;
    next if $author =~ /,.+,/; #More than one author, skip!
    $auth{"$author, $birth-$death"}++
}
foreach $auth (sort keys %auth) {
    $THIS = $URL;
    $A = uri_escape_utf8($auth);
    $THIS =~ s|XXX|$A|;
    $FILE = "$tempDir/$auth.xml";
    getstore($THIS, $FILE);
    $VIAF = `$getVIAF '$FILE'`;
    $all++;
    $bad++ if $VIAF =~ /0\t/;
    print "$auth\t$VIAF\n";
}
print STDERR "Found $all authors, no VIAF for $bad.\n"
