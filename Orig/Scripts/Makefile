elements:
	$s -xi -xsl:text-elements.xsl ../../driver.tei | sort | uniq -c
incipits:
	$s -xi -xsl:first-head.xsl ../../driver.tei
explicits:
	$s -xi -xsl:last-tail.xsl ../../driver.tei

test-eziss:
	$s -xsl:prep_spoti.xsl ../eZISS/spoti-2019-10-15.xml > ../eZISS/spoti.xml
	$j ../eZISS/spoti.xml
test-wiki:
	rm -f tmp/*
	#add-meta-wiki.pl ../slv-index.txt ../slv-authors.txt SLV20001 < ../Wiki/SLV20001.md.xml > tmp/SLV20001.xml
	#java -jar /usr/local/bin/saxon9he.jar -xsl:fix-tags-wiki.xsl tmp/SLV20001.xml > tmp/SLV20001.eltec.xml
	wiki2eltec.pl ../slv-index.txt ../slv-authors.txt '../Wiki/SLV20001.md.xml' tmp
	#wiki2eltec.pl ../slv-index.txt ../slv-authors.txt '../Wiki/*.md.xml' tmp
	$j tmp/*.xml

test-imp:
	rm -f tmp/*
	add-meta-imp.pl ../slv-index.txt ../slv-authors.txt < ../IMP/WIKI00048-1896.xml > tmp/WIKI00048.xml
	$s -xsl:fix-tags-imp.xsl tmp/WIKI00048.xml > tmp/WIKI00048.eltec.xml
	$j tmp/WIKI00048.eltec.xml

all:	wiki eziss val
xall:	clean imp wiki eziss val
val:
	java -jar /usr/local/bin/jing.jar ../../../Schemas/eltec-1.rng \
	../../level1/*.xml
eziss:	grab-eziss convert-eziss
imp:	grab-imp convert-imp
wiki:	grab-wiki convert-wiki

convert-eziss:
	$s -xsl:prep_spoti.xsl ../eZISS/spoti-2019-10-15.xml > ../../level1/SLV30001.xml
grab-eziss:
	#Only one novel, so we don't complicate
	mkdir -p ../eZISS
	wget http://nl.ijs.si/e-zrc/izidor/tei/spoti-2007-10-08.xml
	wget http://nl.ijs.si/e-zrc/izidor/tei/tei2.dtd
	mv spoti-2007-10-08.xml ../eZISS/
fix-wiki:
	wiki2eltec.pl ../slv-index.txt ../slv-authors.txt \
	'../Wiki/SLV20001.md.xml' ../../level1
convert-wiki:
	wiki2eltec.pl ../slv-index.txt ../slv-authors.txt \
	'../Wiki/*.md.xml' ../../level1
grab-wiki:
	grab-wiki.pl < ../slv-index.txt > grab-wiki.sh
	chmod +x grab-wiki.sh
	mkdir -p ../Wiki
	./grab-wiki.sh
fix-imp:
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00048-*.xml' ../../level1
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00058-*.xml' ../../level1
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00132-*.xml' ../../level1
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00279-*.xml' ../../level1
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00324-*.xml' ../../level1
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00421-*.xml' ../../level1
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00461-*.xml' ../../level1
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/WIKI00476-*.xml' ../../level1
convert-imp:
	imp2eltec.pl ../slv-index.txt ../slv-authors.txt \
	'../IMP/*.xml' ../../level1
grab-imp:
	grab-imp.pl < ../slv-index.txt > grab-imp.sh
	mkdir -p ../IMP
	rm -f ../IMP/* 
	chmod +x grab-imp.sh
	./grab-imp.sh
clean:
	rm -f ../../level1/SLV*.xml
#Do not use anymore, slv-authors.txt is now manually edited
xxx-viaf:
	get_viaf.pl < ../slv-index.txt > ../slv-authors.txt
#j = java -jar /usr/local/bin/jing.jar https://distantreading.github.io/Schema/eltec-1.rng
j = java -jar /usr/local/bin/jing.jar ../../../Schemas/eltec-1.rng
s = java -jar /usr/local/bin/saxon9he.jar
