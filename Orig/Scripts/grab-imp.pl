#!/usr/bin/perl
use warnings;
use utf8;
binmode STDERR, 'utf8';
binmode STDIN,  'utf8';
binmode STDOUT, 'utf8';
$FIX = 'java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl';
print "### Grab selected IMP books and prepare them from ElTeC\n";
print "cd ../IMP\n";
print "rm -fr *\n";
print "wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-dl-tei.zip\n";
print "wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-corpus-tei.zip\n";
while (<>) {
    next if /Kanoničnost/;
    chomp;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $digitised, $period, $words, $canon, 
	$reprints, $imp_id) =
	    split /\t/;
    unless ($imp_id) {
	print STDERR "WARN: no source for $author: $title\n";
	next
    }
    unless ($imp_id =~ /^WIKI\d+$/) {
	print STDERR "WARN: non-IMP signature '$imp_id' for $author: $title\n";
	next
    }
    ($index_year = $published) =~ s/[,-].+//; 
    $fName_txt = "$imp_id-$index_year.xml";
    $fName_ana = "$imp_id-$index_year-ana.xml";
    print "# $imp_id: $author. $title\n";
    print "unzip IMP-dl-tei.zip     IMP-dl-tei/$fName_txt\n";
    print "unzip IMP-corpus-tei.zip IMP-corpus-tei/$fName_ana\n";
    print "$FIX IMP-dl-tei/$fName_txt     > $imp_id.txt.xml\n";
    print "$FIX IMP-corpus-tei/$fName_ana > $imp_id.ana.xml\n";
}
print "rm IMP-dl-tei.zip\n";
print "rm -r IMP-dl-tei\n";
print "rm IMP-corpus-tei.zip\n";
print "rm -r IMP-corpus-tei\n";
