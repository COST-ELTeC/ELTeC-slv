#!/usr/bin/perl
use warnings;
use utf8;
binmode STDERR, 'utf8';
binmode STDIN,  'utf8';
binmode STDOUT, 'utf8';
$GET = 'https://sl.wikisource.org/w/index.php?title=XXX&action=raw';
$FIX = 'java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl';
print "### Grab selected WikiVir books and prepare them from ElTeC\n";
print "cd ../Wiki\n";
print "rm -fr *\n";
while (<>) {
    next if /Kanoničnost/;
    chomp;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $digitised, $period, $words, $canon, 
	$reprints, $wiki_id) =
	    split /\t/;
    unless ($wiki_id) {
	print STDERR "WARN: no source for $author: $title\n";
	next
    }
    next unless $wiki_id =~ m|^https://sl.wikisource.org|;
    print "# $wiki_id\n";
    $wiki_id =~ s|^https://sl.wikisource.org/wiki/||;
    $THIS = $GET;
    $THIS =~ s|XXX|$wiki_id|;
    print "wget -q -O '$wiki_id.md' '$THIS'\n";
    #print "$FIX IMP-dl-tei/$fName_txt     > $wiki_id.txt.xml\n";
}
#print "rm -r IMP-corpus-tei\n";
