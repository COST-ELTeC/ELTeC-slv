test-chn:
	imp2eltec.pl ../slv-index.txt '../IMP/*.txt.xml' tmp
test-chn1:
	imp2eltec.pl ../slv-index.txt '../IMP/WIKI00024.txt.xml' tmp
val:
	java -jar /usr/local/bin/jing.jar ../../../Schemas/eltec-1.rng \
	../../level1/SLV00024.xml
testmd:
	#cat ../Wiki/*.md | md2tei.pl | sort | uniq -c > tmp/md-tags.tbl
	md2tei.pl ../Wiki/Zorin.md > tmp/Zorin.xml

test-conv:
	mkdir -p tmp
	add-meta-imp.pl ../slv-index.txt < ../IMP/WIKI00024.txt.xml > tmp/WIKI00024.xml
	$s -xsl:fix-tags-imp.xsl tmp/WIKI00024.xml > tmp/SL-WIKI00024.xml
	$j tmp/SL-WIKI00024.xml
test-id:
	$s -xsl:id_p.xsl tmp/WIKI00024-1891.xml > tmp/WIKI00024-1891.id.xml

all:	grab-imp convert-dl
#Do not use anymore, slv-authors.txt is now manually edited
xxx-viaf:
	get_viaf.pl < ../slv-index.txt > ../slv-authors.txt
grab-wiki:
	grab-wiki.pl < ../slv-index.txt > grab-wiki.sh
	mkdir -p ../Wiki
	chmod +x grab-wiki.sh
	./grab-wiki.sh
convert-dl:
	rm -f ../../level1/SLV*.xml
	imp2eltec.pl ../slv-index.txt '../IMP/*.txt.xml' ../../level1
grab-imp:
	grab-imp.pl < ../slv-index.txt > grab-imp.sh
	mkdir -p ../IMP
	rm -f ../IMP/* 
	chmod +x grab-imp.sh
	./grab-imp.sh

j = java -jar /usr/local/bin/jing.jar https://distantreading.github.io/Schema/eltec-1.rng
s = java -jar /usr/local/bin/saxon9he.jar
