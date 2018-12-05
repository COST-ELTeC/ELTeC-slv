### Grab selected IMP books and prepare them from ElTeC
cd ../IMP
rm -fr *
wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-dl-tei.zip
wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-corpus-tei.zip
# WIKI00279: Bedenek, Jakob. Cvet in sad
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00279-1877.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00279-1877-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00279-1877.xml     > WIKI00279.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00279-1877-ana.xml > WIKI00279.ana.xml
# WIKI00024: Bedenek, Jakob. Od pluga do krone
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00024-1891.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00024-1891-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00024-1891.xml     > WIKI00024.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00024-1891-ana.xml > WIKI00024.ana.xml
# WIKI00112: Detela, Fran. Veliki grof
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00112-1885.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00112-1885-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00112-1885.xml     > WIKI00112.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00112-1885-ana.xml > WIKI00112.ana.xml
# WIKI00135: Janežič, Ivan. Gospa s pristave
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00135-1894.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00135-1894-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00135-1894.xml     > WIKI00135.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00135-1894-ana.xml > WIKI00135.ana.xml
# WIKI00217: Jurčič, Josip. Slovenski svetec in učitelj
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00217-1886.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00217-1886-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00217-1886.xml     > WIKI00217.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00217-1886-ana.xml > WIKI00217.ana.xml
# WIKI00216: Jurčič, Josip, Kersnik, Janko. Rokovnjači
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00216-1881.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00216-1881-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00216-1881.xml     > WIKI00216.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00216-1881-ana.xml > WIKI00216.ana.xml
# WIKI00194: Kersnik, Janko. Na Žerinjah
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00194-1876.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00194-1876-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00194-1876.xml     > WIKI00194.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00194-1876-ana.xml > WIKI00194.ana.xml
# WIKI00058: Kersnik, Janko. Ciklamen
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00058-1883.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00058-1883-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00058-1883.xml     > WIKI00058.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00058-1883-ana.xml > WIKI00058.ana.xml
# WIKI00187: Kersnik, Janko. Agitator
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00187-1885.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00187-1885-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00187-1885.xml     > WIKI00187.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00187-1885-ana.xml > WIKI00187.ana.xml
# WIKI00099: Koder, Anton. Marjetica
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00099-1877.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00099-1877-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00099-1877.xml     > WIKI00099.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00099-1877-ana.xml > WIKI00099.ana.xml
# WIKI00103: Koder, Anton. Zvezdana
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00103-1883.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00103-1883-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00103-1883.xml     > WIKI00103.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00103-1883-ana.xml > WIKI00103.ana.xml
# WIKI00098: Koder, Anton. Luteranci
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00098-1883.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00098-1883-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00098-1883.xml     > WIKI00098.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00098-1883-ana.xml > WIKI00098.ana.xml
# WIKI00483: Levstik, Vladimir. Za svobodo in ljubezen
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00483-1913.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00483-1913-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00483-1913.xml     > WIKI00483.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00483-1913-ana.xml > WIKI00483.ana.xml
# WIKI00456: Malovrh, Miroslav. Ljubezen in junaštva strahopetnega praporščaka
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00456-1910.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00456-1910-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00456-1910.xml     > WIKI00456.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00456-1910-ana.xml > WIKI00456.ana.xml
# WIKI00526: Murnik, Rado. Hči grofa Blagaja
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00526-1911.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00526-1911-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00526-1911.xml     > WIKI00526.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00526-1911-ana.xml > WIKI00526.ana.xml
# WIKI00231: Pajk, Pavlina. Arabela
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00231-1885.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00231-1885-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00231-1885.xml     > WIKI00231.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00231-1885-ana.xml > WIKI00231.ana.xml
# WIKI00083: Pajk, Pavlina. Roman starega samca
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00083-1895.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00083-1895-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00083-1895.xml     > WIKI00083.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00083-1895-ana.xml > WIKI00083.ana.xml
# WIKI00240: Pajk, Pavlina. Slučaji usode
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00240-1897.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00240-1897-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00240-1897.xml     > WIKI00240.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00240-1897-ana.xml > WIKI00240.ana.xml
# WIKI00227: Pesjak, Luiza. Beatin dnevnik
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00227-1887.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00227-1887-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00227-1887.xml     > WIKI00227.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00227-1887-ana.xml > WIKI00227.ana.xml
# WIKI00417: Pregelj, Ivan. Tlačani
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00417-1915.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00417-1915-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00417-1915.xml     > WIKI00417.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00417-1915-ana.xml > WIKI00417.ana.xml
# WIKI00496: Saleški Finžgar, Fran. Iz modernega sveta
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00496-1904.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00496-1904-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00496-1904.xml     > WIKI00496.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00496-1904-ana.xml > WIKI00496.ana.xml
# WIKI00406: Tavčar, Ivan. Izza kongresa
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00406-1905.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00406-1905-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00406-1905.xml     > WIKI00406.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00406-1905-ana.xml > WIKI00406.ana.xml
rm IMP-dl-tei.zip
rm -r IMP-dl-tei
rm IMP-corpus-tei.zip
rm -r IMP-corpus-tei
