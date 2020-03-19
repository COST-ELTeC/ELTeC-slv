#!/usr/bin/perl
use warnings;
use utf8;
my $indexFile = shift;
my $authorFile = shift;
binmode STDERR, 'utf8';
binmode STDIN,  'utf8';
binmode STDOUT, 'utf8';

#Read in author index and store in hash
open IDX, '<:utf8', $authorFile or die "Can't open input $authorFile\n";
while (<IDX>) {
    chomp;
    my ($authordates, $registry, $id, $url, $wiki) = split /\t/;
    #We assume no names are doubled, so we ignore birth-death dates
    ($author) = $authordates =~ /(.+), \d\d\d\d-\d\d\d\d$/ 
	or die "Bad author $authordates\n";
    $author{$author} = join "\t", (lc $registry, $id, $wiki);
}
close IDX;

#Read in index, covert Slovene values to ELTeC ones, and store in hash
open IDX, '<:utf8', $indexFile or die "Can't open input $indexFile\n";
while (<IDX>) {
    next if /Kanoničnost/;
    chomp;
    #Fix remnants of excel saved as text
    s/^"//; s/"$//; s/\t"/\t/g; s/"\t/\t/g; s/""/"/g; s/­//g;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $source, $digitised, $period, $words, $canon, 
	$reprints, $status, $signature, $url, $alturl) =
	    split /\t/;

    $imp_id = $url; #IMP units do not have a URL, but IMP signature
    
    next if $status eq 'WAIT';
    unless ($imp_id) {
	print STDERR "WARN: no source for $author: $title\n";
	next
    }
    next unless $imp_id and $imp_id =~ /^WIKI\d+$/;

    if (exists $author{$author}) {
	($registry, $registry_id, $wiki) = split(/\t/, $author{$author});
	$wiki = 0 unless $wiki and $wiki ne '-';
    }
    else {die "Can't find author info for $author!\n"}
    
    if    ($sex =~ /M/i) {$eltec_sex = 'M'}
    elsif ($sex =~ /Ž/i) {$eltec_sex = 'F'}
    else {die "Bad sex $sex for $imp_id in index!\n"};

    if    ($canon =~ /DA/i)    {$eltec_canon = 'high'}
    elsif ($canon =~ /NE/i)    {$eltec_canon = 'low'}
    #elsif ($canon =~ /DELNO/i) {$eltec_canon = 'medium'}
    #Now only low and high are allowed!
    #Provisionaly setting to "high"!
    elsif ($canon =~ /DELNO/i) {$eltec_canon = 'high'}
    else {die "Bad canon $canon for $imp_id in index!\n"};

    if    (!$reprints)    {$reprints = 0}
    elsif ($reprints =~ /^\d+$/) {}
    else {die "Bad reprints $reprints for $imp_id in index!\n"};

    if    ($period eq 'A') {$eltec_period = 'T1'}
    elsif ($period eq 'B') {$eltec_period = 'T2'}
    elsif ($period eq 'C') {$eltec_period = 'T3'}
    elsif ($period eq 'D') {$eltec_period = 'T4'}
    else {die "Bad period $period for $imp_id in index!\n"};
    
    ## Note that for IMP $author, $title, $published is really taken from the teiHeader
    ## Similarly $period, $words is computed by the conversion scripts
    $meta{$imp_id} = join "\t", ($signature, $title, $label, 
				 $author, $eltec_sex, $birth, $death, $registry, $registry_id, $wiki,
				 $eltec_period, $eltec_canon, $reprints);
}
close IDX;
	
#Process file
local $/ = undef;
$_ = <>;

($imp_id) = /xml:id="(.+?)-\d\d\d\d"/s 
    or die "Bad ID in $_!\n";

## Note that reprints is not used: not clear where to put it and it is mostly empty anyway
my ($signature, $title, $label, 
    $author, $eltec_sex, $birth, $death, $registry, $registry_id, $wiki,
    $eltec_period, $eltec_canon, $reprints) =
    split "\t", $meta{$imp_id};

$id = $signature;

#Put both titles in "orig" titles, "reg" will be used for regular title. (hacky)
if ($label and $label ne 'brez oznake') {
    #s|(<title type="orig"[^>]*>).+?</title>|$1$title. $label.</title>|s
    s|(<title type="orig"[^>]*>).+?</title>|$1$title</title>\n               $1$label</title>|s
}

s| xml:id=".+?"| xml:id="$id"|;
($an) = m|<author>(.+)</author>|;
print STDERR "WARN: $id authors mismatch: $an !== $author, taking $author\n"
    if $an ne $author;

#Ugly hack for the only novel that has two authors
if ($imp_id eq 'WIKI00216') {
    $author2 = '               ';
    $author2 .= '<author ref="viaf:34746806 https://sl.wikipedia.org/wiki/Janko_Kersnik">';
    $author2 .= 'Kersnik, Janko (1852-1897)</author>';
    s|<author>.+</author>|<author>$author ($birth-$death)</author>\n$author2|
}
else {
    s|<author>.+</author>|<author>$author ($birth-$death)</author>|
}

if ($registry) {
    s|<author>|<author ref="$registry:$registry_id">|;
    if ($wiki) {s|<author ref="(.+?)">|<author ref="$1 $wiki">| or die "$_"}
    else {print STDERR "WARN: $id author $author has no WIKI\n"}
}
else {die "ERROR: $id author $author has no VIAF/CONOR\n"}


#Calculate and insert number of words
($wDOC) = m|<body[ >](.+)</body>|s;
$wDOC=~ s|<.+?>||gs;
my $docWords = 0;
++$docWords while $wDOC =~ /\S+/gs;
my $measure = "<measure unit=\"words\">$docWords</measure></extent>";
s|</titleStmt>|</titleStmt>\n<extent>$measure|;

#Also add stubs for metadata that gets inserted in next step (XSLT)
$ns = 'http://distantreading.net/eltec/ns';
$textDesc  = "<textDesc xmlns:eltec=\"$ns\">\n";
$textDesc .= "<eltec:authorGender key=\"$eltec_sex\"/>\n";
$textDesc .= "<eltec:size key=\"\"/>\n";
$textDesc .= "<eltec:canonicity key=\"$eltec_canon\"/>\n";
$textDesc .= "<eltec:timeSlot key=\"$eltec_period\"/>\n";
$textDesc .= "</textDesc>\n";
s|</profileDesc>|$textDesc</profileDesc>|;
print;
