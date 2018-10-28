all:	grab-imp convert
convert:
	imp2eltec.pl ../slv-index-imp.txt '../IMP/*.xml' ../../level1
test-conv:
	mkdir -p tmp
	add-meta-imp.pl ../slv-index-imp.txt < ../IMP/WIKI00024.xml > tmp/WIKI00024.xml
	$s -xsl:fix-tags-imp.xsl tmp/WIKI00024.xml > tmp/SL-WIKI00024.xml
	$j tmp/SL-WIKI00024.xml
grab-imp:
	grab-imp.pl < ../slv-index-imp.txt > grab-imp.sh
	mkdir -p ../IMP
	chmod +x grab-imp.sh
	./grab-imp.sh

j = java -jar /usr/local/bin/jing.jar https://distantreading.github.io/Schema/eltec-1.rng
s = java -jar /usr/local/bin/saxon9he.jar
