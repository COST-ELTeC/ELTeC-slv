#!/usr/bin/perl
use warnings;
use utf8;
use Cwd qw(cwd);
binmode STDERR, 'utf8';
binmode STDIN,  'utf8';
binmode STDOUT, 'utf8';
$CDIR = cwd;
$GET =  'https://sl.wikisource.org/w/index.php?title=XXX&action=raw';
$FIX1 = "$CDIR/fix-text-wiki.pl";
$CNV =  "$CDIR/Stylesheets/bin/markdowntotei --profiledir=$CDIR/profiles ";

print "### Grab selected WikiVir books and prepare them for ElTeC\n";
print "cd ../Wiki\n";
print "rm -f *\n";
while (<>) {
    next if /Kanoničnost/;
    chomp;
    s/^"//; s/"$//; s/\t"/\t/g; s/"\t/\t/g; s/""/"/g; s/­//g;
    my ($author, $sex, $birth, $death, $title, 
	$label, $published, $digitised, $period, $words, $canon, 
	$reprints, $status, $signature, $url) =
	    split /\t/;
    next if $status eq 'WAIT';
    next unless $signature =~ /SLV1/; #WikiVir have signature starting with SLV1
    unless ($url =~ m|https://sl.wikisource.org/wiki/|) {
	print STDERR "ERROR: SLV1 but wrong url $url\n";
	next
    }
    ($in_fName) = $url =~ m|https://sl.wikisource.org/wiki/(.+)|;
    $out_fName = "$signature.md";
    print "# $signature / $in_fName: $author. $title\n";
    $THIS = $GET;
    $THIS =~ s|XXX|$in_fName|;
    print "wget -q -O '$in_fName.md' '$THIS'\n";
    print "$FIX1 < '$in_fName.md' > $out_fName\n";
    print "$CNV $out_fName\n";
}
