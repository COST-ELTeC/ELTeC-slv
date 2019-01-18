testmd:
	md2html.pl ../Wiki/Zorin.md > Zorin.html

test-conv:
	mkdir -p tmp
	add-meta-imp.pl ../slv-index.txt < ../IMP/WIKI00024.txt.xml > tmp/WIKI00024.xml
	$s -xsl:fix-tags-imp.xsl tmp/WIKI00024.xml > tmp/SL-WIKI00024.xml
	$j tmp/SL-WIKI00024.xml
test-id:
	$s -xsl:id_p.xsl tmp/WIKI00024-1891.xml > tmp/WIKI00024-1891.id.xml

all:	viaf grab-imp convert-dl
viaf:
	get_viaf.pl < ../slv-index.txt > ../slv-authors.txt
grab-wiki:
	grab-wiki.pl < ../slv-index.txt > grab-wiki.sh
	mkdir -p ../Wiki
	chmod +x grab-wiki.sh
	./grab-wiki.sh
convert-dl:
	imp2eltec.pl ../slv-index.txt '../IMP/*.txt.xml' ../../level1
grab-imp:
	grab-imp.pl < ../slv-index.txt > grab-imp.sh
	mkdir -p ../IMP
	chmod +x grab-imp.sh
	./grab-imp.sh

j = java -jar /usr/local/bin/jing.jar https://distantreading.github.io/Schema/eltec-1.rng
s = java -jar /usr/local/bin/saxon9he.jar
