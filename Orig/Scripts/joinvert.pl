#!/usr/bin/perl
use warnings;
use utf8;
$indexFile = shift;
$inDir = shift;
$outFile = shift;
binmode(STDOUT,'utf8');
binmode(STDERR,'utf8');

#Read in author index and store in hash
open IDX, '<:utf8', $indexFile or die "Can't open input $indexFile\n";
my $Heading = <IDX>;
while (<IDX>) {
    chomp;
    my ($id, $name, $viaf, $sex, $birth, $death, $title, 
	$subtitle, $printed, $digitised, $period, $size, $canon, 
	$words, $tokens) = split /\t/;
    push(@{$printed{$printed}}, $id)
}
close IDX;
unlink $outFile;
foreach $year (sort keys %printed) {
    foreach $id (@{$printed{$year}}) {
	$inFile = "$inDir/" . $id . "-L2.vert";
	print STDERR "$year/$id ";
	`cat $inFile >> $outFile`;
    }
}
print STDERR "\n";
