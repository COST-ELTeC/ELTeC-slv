#!/usr/bin/perl
#Some WikiVir sources have single line breaks in text inside paragraphs, which gets
#converted to separate paragraps - this script removes such line-breaks
#It also cleans up weird Wiki formatting in {{...}}
#
use warnings;
use utf8;
binmode(STDIN, 'utf8');
binmode(STDOUT, 'utf8');
local $/ = undef;
$_ = <>;
s|\cM||gs; #Just in case DOS EOLs
s|­ *||gs; #soft hyphen
s|…|...|gs; #elipsis
s|,,|„|gs;  #quote

#Proper MD headings "## Prvo poglavje" instead of "==Prvo poglavje.=="
s/^(=+)/'#' x length $1/gem;
s/^(#+) *(.+?) *=+/$1 $2\n\n/gm;

#Indent: :::::{{razprto|Pavel}}
s|\n:+|\n|g;

#Some strange formatting: '''V''' prvem tednu 
s|'''+(.+?)'''+|$1|g;

##s|\{\{prelom strani}}|\cL|gs; #Can't: ^L illegal in XML!

# {{razprto|Pavel}} - change to HTML tag (which we then throw away... 
s!\{\{razprto\|(.+?)\}\}!<hi>$1</hi>!gs;

# {{redakcija|vatih|vratih}}  - correct silently
s!\{\{redakcija\|.+?\|(.+?)\}\}!$1!gs;

# {{vrstica|Ana Renata pleše.}} - as if new paragraph
s!\{\{vrstica\|(.+?)\}\}!\n$1\n!gs;

#Get rid of first meta format block, e.g.
# {{naslov-mp
# | naslov= Kmetski triumvirat. Historičen roman.
# | normaliziran naslov= Kmetski triumvirat
# | avtor= Anton Koder
# | opombe= 
# | obdelano= 4
# | dovoljenje= javna last
# | izdano= ''{{mp|delo|Kres}}'', 4/1 ({{mp|leto|1884}})
# | vir= {{fc|dlib|1NVXVJ2O|s=1−10|dLib 1}}, {{fc|dlib|8NL8H5A3|s=65−73|dLib 2}}, {{fc|dlib|XCWBY5NL|s=121−131|dLib 3}}, {{fc|dlib|NIXIC9CV|s=170−178|dLib 4}}, {{fc|dlib|VG016OYF|s=226−234|dLib 5}}, {{fc|dlib|WUHIVOGY|s=273−280|dLib 6}}, {{fc|dlib|6CGDCI1C|s=329−337|dLib 7}}, {{fc|dlib|3L57QPM6|s=377−386|dLib 8}}, {{fc|dlib|B3AAFS18|s=433−440|dLib 9}}, {{fc|dlib|XFFXHI2F|s=481−489|dLib 10}}, {{fc|dlib|E11EYGID|s=537−545|dLib 11}}, {{fc|dlib|DUMJ0121|s=585−592|dLib 12}}.
# }}
#
# But doesn't work too well - let XSLT nuke such paragraphs
s!\{\{..\|.+?\}\}!!gs;
s!^\{\{.+?\}\}!!s;

# Any other of type {{bla|Ana Renata pleše.}}
s!\{\{[^|}]+\|(.+?)\}\}!$1!gs;

#Get rid of remaining formatting
s!\{\{.+?\}\}!!gs;

#Get rid of meta-information
s!\[\[.+?\]\]!!gs;

#Put in new line just in case
s!</p>!\n!g;

#Poems - I'd like to preserve them but don't know how...
# e.g.:
#<poem align="center"> Leži mi rávno poljé, leži, Na polji cvetó cvetice tri, Cvetice tri!
# Cvetica perva govori: Oh, mene glávica boli, Hudó boli!
#</poem>
s!<poem.*?>!<poem>!g;

#Remove notes, can't be bothered to deal with them
s!<ref>.+?</ref>!!gs;

#Get rid of all HTML tags
s!<.+?>!!g;

# Join fake paragraphs
s|\n([[:alnum:]—-])| $1|gs;

# Get rid of overabundant new lines
s!\n\n+!\n\n!g;

#Asterisks are a problem, usually should be taken literaly, except
#*''oteti'', otmem vzeti, ugrabiti
#*''para'' denar
# Now a bizzare escape, but this persists into XML - get rid of it later!
s|\*|✱|g;
s|✱''|*''|g;

#Ordinals are a problem, should be taken literaly, e.g.
# 5. avgusta
# Now escaped, but this persists into XML - get rid of it later!
s|^ ?(\d+\.)|\\$1|gm;

print;
