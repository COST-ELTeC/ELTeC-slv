### Grab selected IMP books and prepare them from ElTeC
cd ../IMP
rm -fr *
wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-dl-tei.zip
wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-corpus-tei.zip
# WIKI00094: Bartel, Anton. Pomladanski vetrovi
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00094-1881.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00094-1881-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00094-1881.xml     > WIKI00094.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00094-1881-ana.xml > WIKI00094.ana.xml
# WIKI00024: Bedenek, Jakob. Od pluga do krone
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00024-1891.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00024-1891-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00024-1891.xml     > WIKI00024.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00024-1891-ana.xml > WIKI00024.ana.xml
# WIKI00410: Cankar, Ivan. Tujci
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00410-1901.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00410-1901-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00410-1901.xml     > WIKI00410.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00410-1901-ana.xml > WIKI00410.ana.xml
# WIKI00401: Cankar, Ivan. Na klancu
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00401-1902.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00401-1902-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00401-1902.xml     > WIKI00401.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00401-1902-ana.xml > WIKI00401.ana.xml
# WIKI00398: Cankar, Ivan. Martin Kačur
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00398-1906.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00398-1906-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00398-1906.xml     > WIKI00398.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00398-1906-ana.xml > WIKI00398.ana.xml
# WIKI00404: Cankar, Ivan. Novo življenje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00404-1908.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00404-1908-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00404-1908.xml     > WIKI00404.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00404-1908-ana.xml > WIKI00404.ana.xml
# WIKI00363: Detela, Fran. Malo življenje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00363-1882.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00363-1882-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00363-1882.xml     > WIKI00363.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00363-1882-ana.xml > WIKI00363.ana.xml
# WIKI00112: Detela, Fran. Veliki grof
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00112-1885.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00112-1885-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00112-1885.xml     > WIKI00112.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00112-1885-ana.xml > WIKI00112.ana.xml
# WIKI00111: Detela, Fran. Pegam in Lambergar
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00111-1891.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00111-1891-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00111-1891.xml     > WIKI00111.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00111-1891-ana.xml > WIKI00111.ana.xml
# WIKI00278: Detela, Fran. Trojka
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00278-1897.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00278-1897-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00278-1897.xml     > WIKI00278.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00278-1897-ana.xml > WIKI00278.ana.xml
# WIKI00364: Detela, Fran. Novo življenje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00364-1908.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00364-1908-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00364-1908.xml     > WIKI00364.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00364-1908-ana.xml > WIKI00364.ana.xml
# WIKI00368: Detela, Fran. Tujski promet
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00368-1912.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00368-1912-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00368-1912.xml     > WIKI00368.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00368-1912-ana.xml > WIKI00368.ana.xml
# WIKI00502: Fatur, Lea. V burji in strasti
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00502-1905.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00502-1905-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00502-1905.xml     > WIKI00502.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00502-1905-ana.xml > WIKI00502.ana.xml
# WIKI00506: Fatur, Lea. Za Adrijo
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00506-1909.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00506-1909-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00506-1909.xml     > WIKI00506.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00506-1909-ana.xml > WIKI00506.ana.xml
# WIKI00352: Fatur, Lea. Komisarjeva hči
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00352-1910.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00352-1910-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00352-1910.xml     > WIKI00352.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00352-1910-ana.xml > WIKI00352.ana.xml
# WIKI00048: Govekar, Fran. V krvi
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00048-1896.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00048-1896-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00048-1896.xml     > WIKI00048.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00048-1896-ana.xml > WIKI00048.ana.xml
# WIKI00425: Gruden, Josip. Na vojvodskem prestolu
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00425-1901.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00425-1901-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00425-1901.xml     > WIKI00425.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00425-1901-ana.xml > WIKI00425.ana.xml
# WIKI00126: Jaklič, Fran. Ljudska osveta
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00126-1892.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00126-1892-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00126-1892.xml     > WIKI00126.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00126-1892-ana.xml > WIKI00126.ana.xml
# WIKI00373: Jaklič, Fran. O, ta testament
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00373-1900.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00373-1900-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00373-1900.xml     > WIKI00373.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00373-1900-ana.xml > WIKI00373.ana.xml
# WIKI00135: Janežič-Kraljev, Ivan. Gospa s pristave
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00135-1894.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00135-1894-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00135-1894.xml     > WIKI00135.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00135-1894-ana.xml > WIKI00135.ana.xml
# WIKI00279: Jurčič, Josip. Cvet in sad
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00279-1877.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00279-1877-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00279-1877.xml     > WIKI00279.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00279-1877-ana.xml > WIKI00279.ana.xml
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
# WIKI00355: Kraigher, Alojz. Mlada ljubezen
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00355-1917.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00355-1917-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00355-1917.xml     > WIKI00355.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00355-1917-ana.xml > WIKI00355.ana.xml
# WIKI00345: Levstik, Vladimir. Blagorodje doktor Ambrož Čander
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00345-1909.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00345-1909-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00345-1909.xml     > WIKI00345.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00345-1909-ana.xml > WIKI00345.ana.xml
# WIKI00483: Levstik, Vladimir. Za svobodo in ljubezen
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00483-1913.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00483-1913-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00483-1913.xml     > WIKI00483.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00483-1913-ana.xml > WIKI00483.ana.xml
# WIKI00478: Levstik, Vladimir. Gadje gnezdo
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00478-1918.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00478-1918-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00478-1918.xml     > WIKI00478.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00478-1918-ana.xml > WIKI00478.ana.xml
# WIKI00458: Malovrh, Miroslav. Pod novim orlom
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00458-1904.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00458-1904-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00458-1904.xml     > WIKI00458.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00458-1904-ana.xml > WIKI00458.ana.xml
# WIKI00455: Malovrh, Miroslav. Kralj Matjaž
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00455-1904.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00455-1904-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00455-1904.xml     > WIKI00455.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00455-1904-ana.xml > WIKI00455.ana.xml
# WIKI00459: Malovrh, Miroslav. Strahovalci dveh kron
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00459-1907.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00459-1907-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00459-1907.xml     > WIKI00459.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00459-1907-ana.xml > WIKI00459.ana.xml
# WIKI00457: Malovrh, Miroslav. Ljubezen Končanove Klare
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00457-1908.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00457-1908-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00457-1908.xml     > WIKI00457.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00457-1908-ana.xml > WIKI00457.ana.xml
# WIKI00461: Malovrh, Miroslav. Zadnji rodovine Benalja
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00461-1909.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00461-1909-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00461-1909.xml     > WIKI00461.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00461-1909-ana.xml > WIKI00461.ana.xml
# WIKI00460: Malovrh, Miroslav. V študentskih ulicah
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00460-1909.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00460-1909-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00460-1909.xml     > WIKI00460.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00460-1909-ana.xml > WIKI00460.ana.xml
# WIKI00462: Malovrh, Miroslav. Zaljubljeni kapucin
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00462-1910.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00462-1910-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00462-1910.xml     > WIKI00462.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00462-1910-ana.xml > WIKI00462.ana.xml
# WIKI00456: Malovrh, Miroslav. Ljubezen in junaštva strahopetnega praporščaka
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00456-1910.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00456-1910-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00456-1910.xml     > WIKI00456.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00456-1910-ana.xml > WIKI00456.ana.xml
# WIKI00132: Maselj Podlimbarski, Fran. Gorski potoki
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00132-1895.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00132-1895-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00132-1895.xml     > WIKI00132.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00132-1895-ana.xml > WIKI00132.ana.xml
# WIKI00310: Maselj Podlimbarski, Fran. Potresna povest
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00310-1903.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00310-1903-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00310-1903.xml     > WIKI00310.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00310-1903-ana.xml > WIKI00310.ana.xml
# WIKI00311: Maselj Podlimbarski, Fran. Povest Ivana Polaja
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00311-1909.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00311-1909-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00311-1909.xml     > WIKI00311.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00311-1909-ana.xml > WIKI00311.ana.xml
# WIKI00174: Mencinger, Janez. Abadon
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00174-1893.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00174-1893-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00174-1893.xml     > WIKI00174.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00174-1893-ana.xml > WIKI00174.ana.xml
# WIKI00072: Meško, Ksaver. Kam plovemo
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00072-1897.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00072-1897-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00072-1897.xml     > WIKI00072.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00072-1897-ana.xml > WIKI00072.ana.xml
# WIKI00473: Murnik, Rado. Groga in drugi
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00473-1895.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00473-1895-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00473-1895.xml     > WIKI00473.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00473-1895-ana.xml > WIKI00473.ana.xml
# WIKI00526: Murnik, Rado. Hči grofa Blagaja
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00526-1911.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00526-1911-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00526-1911.xml     > WIKI00526.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00526-1911-ana.xml > WIKI00526.ana.xml
# WIKI00476: Murnik, Rado. Na Bledu
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00476-1917.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00476-1917-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00476-1917.xml     > WIKI00476.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00476-1917-ana.xml > WIKI00476.ana.xml
# WIKI00231: Pajk, Pavlina. Arabela
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00231-1885.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00231-1885-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00231-1885.xml     > WIKI00231.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00231-1885-ana.xml > WIKI00231.ana.xml
# WIKI00240: Pajk, Pavlina. Slučaji usode
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00240-1897.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00240-1897-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00240-1897.xml     > WIKI00240.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00240-1897-ana.xml > WIKI00240.ana.xml
# WIKI00234: Pajk, Pavlina. Dušne borbe
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00234-1896.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00234-1896-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00234-1896.xml     > WIKI00234.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00234-1896-ana.xml > WIKI00234.ana.xml
# WIKI00227: Pesjak, Luiza. Beatin dnevnik
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00227-1887.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00227-1887-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00227-1887.xml     > WIKI00227.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00227-1887-ana.xml > WIKI00227.ana.xml
# WIKI00122: Podmilšak, Josip. Žalost in veselje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00122-1870.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00122-1870-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00122-1870.xml     > WIKI00122.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00122-1870-ana.xml > WIKI00122.ana.xml
# WIKI00417: Pregelj, Ivan. Tlačani
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00417-1915.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00417-1915-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00417-1915.xml     > WIKI00417.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00417-1915-ana.xml > WIKI00417.ana.xml
# WIKI00452: Prelesnik, Matija. Naš stari greh
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00452-1903.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00452-1903-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00452-1903.xml     > WIKI00452.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00452-1903-ana.xml > WIKI00452.ana.xml
# WIKI00454: Prelesnik, Matija. V smrtni senci
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00454-1904.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00454-1904-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00454-1904.xml     > WIKI00454.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00454-1904-ana.xml > WIKI00454.ana.xml
# WIKI00273: Saleški Finžgar, Fran. Kvišku
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00273-1899.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00273-1899-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00273-1899.xml     > WIKI00273.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00273-1899-ana.xml > WIKI00273.ana.xml
# WIKI00497: Saleški Finžgar, Fran. Moja duša vasuje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00497-1903.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00497-1903-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00497-1903.xml     > WIKI00497.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00497-1903-ana.xml > WIKI00497.ana.xml
# WIKI00496: Saleški Finžgar, Fran. Iz modernega sveta
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00496-1904.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00496-1904-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00496-1904.xml     > WIKI00496.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00496-1904-ana.xml > WIKI00496.ana.xml
# WIKI00498: Saleški Finžgar, Fran. Sama
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00498-1912.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00498-1912-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00498-1912.xml     > WIKI00498.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00498-1912-ana.xml > WIKI00498.ana.xml
# WIKI00354: Saleški Finžgar, Fran. Boji
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00354-1915.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00354-1915-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00354-1915.xml     > WIKI00354.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00354-1915-ana.xml > WIKI00354.ana.xml
# WIKI00172: Sket, Jakob. Milko Vogrin
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00172-1883.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00172-1883-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00172-1883.xml     > WIKI00172.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00172-1883-ana.xml > WIKI00172.ana.xml
# WIKI00325: Šorli, Ivo. Štefan Zaplotnik
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00325-1916.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00325-1916-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00325-1916.xml     > WIKI00325.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00325-1916-ana.xml > WIKI00325.ana.xml
# WIKI00092: Štrukelj, Ivan. Zmota in povrat
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00092-1892.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00092-1892-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00092-1892.xml     > WIKI00092.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00092-1892-ana.xml > WIKI00092.ana.xml
# WIKI00090: Štrukelj, Ivan. Spletke
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00090-1894.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00090-1894-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00090-1894.xml     > WIKI00090.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00090-1894-ana.xml > WIKI00090.ana.xml
# WIKI00136: Tavčar, Ivan. 4000
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00136-1891.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00136-1891-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00136-1891.xml     > WIKI00136.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00136-1891-ana.xml > WIKI00136.ana.xml
# WIKI00055: Tavčar, Ivan. V Zali
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00055-1894.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00055-1894-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00055-1894.xml     > WIKI00055.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00055-1894-ana.xml > WIKI00055.ana.xml
# WIKI00406: Tavčar, Ivan. Izza kongresa
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00406-1905.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00406-1905-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00406-1905.xml     > WIKI00406.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00406-1905-ana.xml > WIKI00406.ana.xml
# WIKI00421: Trošt, Ivo. Temni oblaki
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00421-1895.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00421-1895-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00421-1895.xml     > WIKI00421.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00421-1895-ana.xml > WIKI00421.ana.xml
# WIKI00488: Zbašnik, Fran. Žrtve
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00488-1901.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00488-1901-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00488-1901.xml     > WIKI00488.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00488-1901-ana.xml > WIKI00488.ana.xml
# WIKI00391: Zbašnik, Fran. Pisana mati
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00391-1909.xml
unzip IMP-corpus-tei.zip IMP-corpus-tei/WIKI00391-1909-ana.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00391-1909.xml     > WIKI00391.txt.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-corpus-tei/WIKI00391-1909-ana.xml > WIKI00391.ana.xml
rm IMP-dl-tei.zip
rm -r IMP-dl-tei
rm IMP-corpus-tei.zip
rm -r IMP-corpus-tei
