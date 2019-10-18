test-wiki:
	#add-meta-wiki.pl ../slv-index.txt ../slv-authors.txt SLV10027 < ../Wiki/SLV10027.md.xml > tmp/SLV10027.xml
	#java -jar /usr/local/bin/saxon9he.jar -xsl:fix-tags-wiki.xsl tmp/SLV10027.xml > tmp/SLV10027.eltec.xml
	wiki2eltec.pl ../slv-index.txt ../slv-authors.txt '../Wiki/*.md.xml' tmp
	$j tmp/*.xml

test-eziss:
	$s -xsl:prep_poti.xsl ../eZISS/spoti-2019-10-15.xml > ../eZISS/spoti.xml
	$j ../eZISS/spoti.xml
wiki-markup:
	cat ../Wiki/*.md | perl -pe 's|>|>\n|' | grep '<' | perl -pe 's|.*<|<|; s|>.*|>|' | sort | uniq -c
test-imp:
	add-meta-imp.pl ../slv-index.txt ../slv-authors.txt < ../IMP/WIKI00024-1891.xml > tmp/WIKI00024.xml
	#$s -xsl:fix-tags-imp.xsl tmp/WIKI00024.xml > tmp/SL-WIKI00024.xml
	#$j tmp/SL-WIKI00024.xml
test-id:
	$s -xsl:id_p.xsl tmp/WIKI00024-1891.xml > tmp/WIKI00024-1891.id.xml

all:	clean imp wiki val
val:
	java -jar /usr/local/bin/jing.jar ../../../Schemas/eltec-1.rng \
	../../level1/*.xml
imp:	grab-imp convert-imp
wiki:	grab-wiki convert-wiki

grab-eziss:
	#Only one novel, so we don't complicate
	mkdir -p ../eZISS
	wget http://nl.ijs.si/e-zrc/izidor/tei/spoti-2007-10-08.xml
	wget http://nl.ijs.si/e-zrc/izidor/tei/tei2.dtd
	mv spoti-2007-10-08.xml ../eZISS/
xxx-convert-wiki:
	wiki2eltec.pl ../slv-index.txt ../slv-authors.txt \
	'../Wiki/*.md.xml' ../../level1
grab-wiki:
	grab-wiki.pl < ../slv-index.txt > grab-wiki.sh
	chmod +x grab-wiki.sh
	mkdir -p ../Wiki
	./grab-wiki.sh
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
