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
    my ($authordates, $registry, $id, $url) = split /\t/;
    #We assume no names are doubled, so we ignore birth-death dates
    ($author) = $authordates =~ /(.+), \d\d\d\d-\d\d\d\d$/ 
	or die "Bad author $authordates\n";
    $author{$author} = join "\t", (lc $registry, $id);
}
close IDX;

#Read in index, covert Slovene values to ELTeC ones, and store in hash
open IDX, '<:utf8', $indexFile or die "Can't open input $indexFile\n";
while (<IDX>) {
    next if /Kanoničnost/;
    chomp;
    #Fix remnants of excel saved as text
    s/^"//; s/"$//; s/\t"/\t/; s/"\t/\t/; s/""/"/g; s/­//g;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $digitised, $period, $words, $canon, 
	$reprints, $status, $signature, $url) =
	    split /\t/;

    $imp_id = $url; #IMP units do not have a URL, but IMP signature
    
    next if $status eq 'WAIT';
    unless ($imp_id) {
	print STDERR "WARN: no source for $author: $title\n";
	next
    }
    next unless $imp_id and $imp_id =~ /^WIKI\d+$/;

    if (exists $author{$author}) {
	($registry, $registry_id) = split(/\t/, $author{$author})
    }
    else {
	$registry = 0;
	$registry_id = 0;
    }
    
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
				 $author, $eltec_sex, $birth, $death, $registry, $registry_id,
				 $eltec_period, $eltec_canon, $reprints);
}
close IDX;
	
#Process file
local $/ = undef;
$_ = <>;

($imp_id) = /xml:id="(.+?)-\d\d\d\d"/s 
    or die "Bad ID in $_!\n";

##Note that label and reprints is not used, as it is not clear where to put this info!
my ($signature, $title, $label, 
    $author, $eltec_sex, $birth, $death, $registry, $registry_id,
    $eltec_period, $eltec_canon, $reprints) =
    split "\t", $meta{$imp_id};

$id = $signature;

s| xml:id=".+?"| xml:id="$id"|;
($an) = m|<author>(.+)</author>|;
print STDERR "WARN: $id authors mismatch: $an !== $author, taking $author\n"
    if $an ne $author;
s|<author>.+</author>|<author>$author ($birth-$death)</author>|;

if ($registry) {
    s|<author>|<author ref="$registry:$registry_id">|
}
else {
    print STDERR "WARN: $id author $an has no VIAF/CONOR\n"
}

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
