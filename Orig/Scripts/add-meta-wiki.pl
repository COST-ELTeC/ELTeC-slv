#!/usr/bin/perl
use warnings;
use utf8;
my $indexFile = shift;
my $authorFile = shift;
my $doc_id = shift;
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
    
    #If more than one year, we take the last one
    $published =~ s/(\d+)-(\d+)/$2/;
    
    next if $status eq 'WAIT';
    next unless $signature =~ /SLV[12]/; #WikiVir have signature starting with SLV1 or SLV2
    unless ($url =~ m|https://sl.wikisource.org/wiki/|) {
	print STDERR "ERROR: SLV1 but wrong url $url\n";
	next
    }

    if (exists $author{$author}) {
	($registry, $registry_id, $wiki) = split(/\t/, $author{$author});
	$wiki = 0 unless $wiki and $wiki ne '-';
    }
    else {die "Can't find author info for $author!\n"}
    
    if    ($sex =~ /M/i) {$eltec_sex = 'M'}
    elsif ($sex =~ /Ž/i) {$eltec_sex = 'F'}
    else {die "Bad sex $sex for $signature in index!\n"};

    if    ($canon =~ /DA/i)    {$eltec_canon = 'high'}
    elsif ($canon =~ /NE/i)    {$eltec_canon = 'low'}
    #elsif ($canon =~ /DELNO/i) {$eltec_canon = 'medium'}
    #Now only low and high are allowed!
    #Provisionaly setting to "high"!
    elsif ($canon =~ /DELNO/i) {$eltec_canon = 'high'}
    else {die "Bad canon $canon for $id in index!\n"};

    if    (!$reprints)    {$reprints = 0}
    elsif ($reprints =~ /^\d+\+?$/) {}
    else {die "Bad reprints $reprints for $signature in index!\n"};

    if    ($period eq 'A') {$eltec_period = 'T1'}
    elsif ($period eq 'B') {$eltec_period = 'T2'}
    elsif ($period eq 'C') {$eltec_period = 'T3'}
    elsif ($period eq 'D') {$eltec_period = 'T4'}
    else {die "Bad period $period for $id in index!\n"};
    
    ## Note that $period, $words is computed by the conversion scripts
    $meta{$signature} = join "\t", ($signature, $url, $title, $label, 
				 $author, $eltec_sex, $birth, $death, $registry, $registry_id, $wiki,
				 $digitised, $published, $eltec_period, $eltec_canon, $reprints);
}
close IDX;
	
## Process file
local $/ = undef;
$_ = <>;

## Note that reprints is not used: not clear where to put it and it is mostly empty anyway
my ($signature, $url, $title, $label, 
    $author, $eltec_sex, $birth, $death, $registry, $registry_id, $wiki,
    $digitised, $published, $eltec_period, $eltec_canon, $reprints) =
    split "\t", $meta{$doc_id};
die unless $doc_id eq $signature;

print STDERR "ERROR: bad digitisation date '$digitised'\n"
    unless $digitised =~ /^[12][901]\d\d$/;

$orig_title = $title;
$sub_title = '';
if ($label and $label ne 'brez oznake') {$sub_title = $label}

s|<TEI.+>|<TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="sl" xml:id="$doc_id">|;

$teiHeader = <<"END";
<teiHeader>
   <fileDesc>
      <titleStmt>
         <title>$title</title>
         <author>$author ($birth-$death)</author>
         <respStmt/>
      </titleStmt>
      <publicationStmt/>
      <sourceDesc>
         <bibl type="digitalSource">
            <title>$author. $title : edicija WikiVir</title>
            <idno type="wikilink">$url</idno>
            <date>$digitised</date>
         </bibl>
         <bibl type="printSource">
            <author>$author</author>
            <title>$orig_title</title>
            <title>$sub_title</title>
            <date>$published</date>
         </bibl>
      </sourceDesc>
   </fileDesc>
   <encodingDesc/>
   <profileDesc>
      <langUsage/>
      <textDesc xmlns:eltec="http://distantreading.net/eltec/ns">
         <eltec:authorGender key="$eltec_sex"/>
         <eltec:size key=""/>
         <eltec:canonicity key="$eltec_canon"/>
         <eltec:timeSlot key="$eltec_period"/>
      </textDesc>
   </profileDesc>
   <revisionDesc/>
</teiHeader>
END

s|<teiHeader>.+?</teiHeader>|$teiHeader|s;
s|\n\s*<title></title>||;  #If subtitle empty

if ($registry) {
    s|<author>|<author ref="$registry:$registry_id">|
}
else {
    print STDERR "WARN: $doc_id author $author has no VIAF/CONOR\n"
}

if ($wiki) {
    s|<author>|<author ref="$wiki">|
}
else {
    print STDERR "WARN: $doc_id author $author has no WIKI\n"
}

#Calculate and insert number of words
($wDOC) = m|<body[ >](.+)</body>|s;
$wDOC=~ s|<.+?>||gs;
my $docWords = 0;
++$docWords while $wDOC =~ /\S+/gs;
my $measure = "<measure unit=\"words\">$docWords</measure></extent>";
s|</titleStmt>|</titleStmt>\n<extent>$measure|;

print;
