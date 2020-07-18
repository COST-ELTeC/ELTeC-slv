#!/usr/bin/perl -w
#How many words were modernised in each text?
use utf8;
my @INFILES = glob(shift);
binmode(STDOUT,'utf8');
binmode(STDERR,'utf8');
foreach $file (@INFILES) {
    ($id)=$file=~m|([^/]+)\.txt|;
    open(TBL,$file);
    binmode(TBL,'utf8');
    $meta = 0;
    $words = 0;
    $mods = 0;
    while (<TBL>) {
	if    (m|<bibl type="printSource">|) {$meta = 1}
	elsif (m|</bibl>|) {$meta = 0}
	elsif ($meta and m|<author.*?>(.+)</author>|) {$author = $1}
	elsif ($meta and m|<title.*?>(.+)</title>|) {$title = $1}
	elsif ($meta and m|<date.*?>(.+)</date>|) {$date = $1}
	elsif (m|<w |) {
	    $words++;
	    $mods++ if m|ModernForm=|
	}
    }
    close TBL;
    print join("\t", $id, $author, $title, $date, $words, $mods);
    ...
    print "\n"
}
