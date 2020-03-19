test-tei1:
	#eltec-conllu2tei.pl ../Anal/SLV10005.conllu.ner ../../level1 ../Test
	${j2} ../Test/*-L2.xml
test-ner:
	conllu2ner.pl ../Anal/SLV00024.conllu ../Anal
test-anal:
	./tei2conllu.pl ../Anal/SLV30001.txt ../Anal
milestones:
	$s -xi -xsl:find-milestones.xsl ../../driver.tei
elements:
	$s -xi -xsl:text-elements.xsl ../../driver.tei | sort | uniq -c
incipits:
	$s -xi -xsl:first-head.xsl ../../driver.tei
explicits:
	$s -xi -xsl:last-tail.xsl ../../driver.tei

test-eziss:
	$s -xsl:prep_spoti.xsl ../eZISS/spoti-2019-10-15.xml > ../eZISS/spoti.xml
	${j1} ../eZISS/spoti.xml
test-wiki:
	rm -f tmp/*
	#./add-meta-wiki.pl ../slv-index.txt ../slv-authors.txt SLV20001 < ../Wiki/SLV20001.md.xml > tmp/SLV20001.xml
	#java -jar /usr/local/bin/saxon9he.jar -xsl:fix-tags-wiki.xsl tmp/SLV20001.xml > tmp/SLV20001.eltec.xml
	./wiki2eltec.pl ../slv-index.txt ../slv-authors.txt '../Wiki/SLV20001.md.xml' tmp
	#./wiki2eltec.pl ../slv-index.txt ../slv-authors.txt '../Wiki/*.md.xml' tmp
	${j1} tmp/*.xml

test-imp:
	rm -f tmp/*
	./add-meta-imp.pl ../slv-index.txt ../slv-authors.txt < ../IMP/WIKI00216-1881.xml > tmp/WIKI00216.xml
	$s -xsl:fix-tags-imp.xsl tmp/WIKI00216.xml > tmp/WIKI00216.eltec.xml
	${j1} tmp/WIKI00216.eltec.xml

nohup:
	nice nohup time make all > nohup.all &
all:	ana2tei
xall:	clean imp wiki eziss val tei2text anal ner ana2tei
val:
	java -jar /usr/local/bin/jing.jar ../../../Schemas/eltec-1.rng \
	../../level1/*.xml
eziss:	convert-eziss
imp:	grab-imp convert-imp
wiki:	grab-wiki convert-wiki

ana2tei:
	ls -d ../Anal/*.conllu.ner | $P --jobs 10 \
	eltec-conllu2tei.pl '{}' '../../level1' '../Test'
	# eltec-conllu2tei.pl '{}' '../../level1' '../../level2'
	${j2} ../Test/*.xml
	#${j2} ../../level2/*.xml
ner:
	ls -d ../Anal/*.conllu | $P --jobs 20 \
	'conllu2ner.pl {} ../Anal'
anal:
	ls -d ../Anal/*.txt | $P --jobs 2 \
	'./tei2conllu.pl {} ../Anal '
tei2text:
	./eltec2text.pl ../../level1 ../Anal

convert-eziss:
	$s -xsl:prep_spoti.xsl ../eZISS/spoti-2019-10-15.xml > ../../level1/SLV30001.xml
#Can't use the following anymore, as manual edits!
xxgrab-eziss:
	#Only one novel, so we don't complicate
	mkdir -p ../eZISS
	wget http://nl.ijs.si/e-zrc/izidor/tei/spoti-2007-10-08.xml
	wget http://nl.ijs.si/e-zrc/izidor/tei/tei2.dtd
	mv spoti-2007-10-08.xml ../eZISS/
fix-wiki:
	./wiki2eltec.pl ../slv-index.txt ../slv-authors.txt \
	'../Wiki/SLV20001.md.xml' ../../level1
convert-wiki:
	./wiki2eltec.pl ../slv-index.txt ../slv-authors.txt \
	'../Wiki/*.md.xml' ../../level1
grab-wiki:
	./grab-wiki.pl < ../slv-index.txt > grab-wiki.sh
	chmod +x grab-wiki.sh
	mkdir -p ../Wiki
	./grab-wiki.sh
convert-imp:
	./imp2eltec.pl ../slv-index.txt ../slv-authors.txt '../IMP/*.xml' ../../level1
grab-imp:
	./grab-imp.pl < ../slv-index.txt > grab-imp.sh
	mkdir -p ../IMP
	rm -f ../IMP/* 
	chmod +x grab-imp.sh
	./grab-imp.sh
clean:
	rm -f ../../level1/SLV*.xml
#Do not use anymore, slv-authors.txt is now manually edited
xxx-viaf:
	./get_viaf.pl < ../slv-index.txt > ../slv-authors.txt
#j1 = java -jar /usr/local/bin/jing.jar https://distantreading.github.io/Schema/eltec-1.rng
j1 = java -jar /usr/local/bin/jing.jar ../../../Schemas/eltec-1.rng
j2 = java -jar /usr/local/bin/jing.jar ../../../Schemas/eltec-2.rng
s = java -jar /usr/local/bin/saxon9he.jar
P = parallel --gnu --halt 2
