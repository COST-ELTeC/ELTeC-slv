#!/usr/bin/perl
use warnings;
use utf8;
my $indexFile = shift;
binmode STDERR, 'utf8';
binmode STDIN,  'utf8';
binmode STDOUT, 'utf8';

#Read in index, covert Slovene values to ELTeC ones, and store in hash
open IDX, '<:utf8', $indexFile or die "Can't open input $indexFile\n";
while (<IDX>) {
    next if /Kanoničnost/;
    chomp;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $period, $words, $canon, 
	$reprints, $imp_id) =
	    split /\t/;
    next unless $imp_id =~ /./;
    if    ($sex =~ /M/i) {$eltec_sex = 'M'}
    elsif ($sex =~ /Ž/i) {$eltec_sex = 'F'}
    else {die "Bad sex $sex for $imp_id in index!\n"};
    if    ($canon =~ /DA/i)    {$eltec_canon = 'high'}
    elsif ($canon =~ /DELNO/i) {$eltec_canon = 'medium'}
    elsif ($canon =~ /NE/i)    {$eltec_canon = 'low'}
    else {die "Bad canon $canon for $imp_id in index!\n"};

    ## We currently do not use $label and $reprints,
    ## as it is not clear where the put the first, 
    ## and the second is empty
    ## Note that $author, $title, $published is taken from the teiHeader
    ## and is in the index only for reference
    ## Similarly $period, $words is computed the conversion scripts
    $meta{$imp_id} = join "\t", ($eltec_sex, $birth, $death, $label, $eltec_canon);
}
close IDX;
	
#Process file
local $/ = undef;
$_ = <>;

($imp_id) = /xml:id="(.+?)-\d\d\d\d"/so 
    or die "Bad ID in $_!\n";
my ($eltec_sex, $birth, $death, $label, $eltec_canon) =
    split "\t", $meta{$imp_id};

$id = "SL-$imp_id"; #ELTeC ID (also filename)
s| xml:id=".+?"| xml:id="$id"|;
s|</author>| ($birth-$death)</author>|;

#Calculate and insert number of words
($wDOC) = m|<body[ >](.+)</body>|so;
$wDOC=~ s|<.+?>||gso;
my $docWords = 0;
++$docWords while $wDOC =~ /\S+/gso;
my $measure = "<measure unit=\"words\">$docWords</measure></extent>";
s|</titleStmt>|</titleStmt>\n<extent>$measure|;

#Also add stubs for metadata that gets inserted in next step (XSLT)
$ns = 'http://distantreading.net/eltec/ns';
$textDesc  = "<textDesc xmlns:eltec=\"$ns\">\n";
$textDesc .= "<eltec:authorGender key=\"$eltec_sex\"/>\n";
$textDesc .= "<eltec:size key=\"\"/>\n";
$textDesc .= "<eltec:canonicity key=\"$eltec_canon\"/>\n";
$textDesc .= "<eltec:timeSlot key=\"\"/>\n";
$textDesc .= "</textDesc>\n";
s|</profileDesc>|$textDesc</profileDesc>|;
print;
