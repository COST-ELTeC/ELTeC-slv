#!/usr/bin/perl -w
#How many words were modernised in each text?
use utf8;
my @INFILES = glob(shift);
binmode(STDOUT,'utf8');
binmode(STDERR,'utf8');
foreach $file (@INFILES) {
    open(TBL,$file);
    binmode(TBL,'utf8');
    $meta = 0;
    $words = 0;
    $mods = 0;
    while (<TBL>) {
	if    (m|<TEI |) {($id) = m|xml:id="(.+?)"|}
	elsif (m|<bibl type="printSource">|) {$meta = 1}
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
    printf "%d\t%d\t%d\t%0.2f\t%s\t%s\t%s\n", $date, $words, $mods, 100 * $mods / $words, 
    $id, $author, $title;
    $allwords += $words;
    $allmods += $mods;
}
printf "*\t%d\t%d\t%0.2f\t*\t*\t*\n", $allwords, $allmods, 100 * $allmods / $allwords, 
