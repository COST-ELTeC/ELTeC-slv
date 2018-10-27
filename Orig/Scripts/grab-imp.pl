#!/usr/bin/perl
use warnings;
use utf8;
binmode STDERR, 'utf8';
binmode STDIN,  'utf8';
binmode STDOUT, 'utf8';
print "cd ../IMP\n";
print "rm -fr *\n";
print "wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-dl-tei.zip\n";
while (<>) {
    next if /Kanoničnost/;
    chomp;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $period, $words, $canon, 
	$reprints, $imp_id) =
	    split /\t/;
    next unless $imp_id =~ /./;
    ($index_year = $published) =~ s/,.+//; 
    $fName = "$imp_id-$index_year";
    print "# $imp_id: $author. $title\n";
    print "unzip IMP-dl-tei.zip IMP-dl-tei/$fName.xml\n";
    print "mv IMP-dl-tei/$fName.xml $imp_id.xml\n";
}
print "rm IMP-dl-tei.zip\n";
print "rm -r IMP-dl-tei\n";
