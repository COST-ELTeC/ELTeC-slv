### Grab selected IMP books and prepare them from ElTeC
cd ../IMP
rm -fr *
wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-dl-tei.zip
wget https://www.clarin.si/repository/xmlui/bitstream/handle/11356/1031/IMP-corpus-tei.zip
# WIKI00526: Murnik, Rado. Hči grofa Blagaja
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00526-1911.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00526-1911.xml     > WIKI00526.txt.xml
# WIKI00506: Fatur, Lea. Za Adrijo
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00506-1909.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00506-1909.xml     > WIKI00506.txt.xml
# WIKI00502: Fatur, Lea. V burji in strasti
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00502-1905.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00502-1905.xml     > WIKI00502.txt.xml
# WIKI00498: Finžgar, Fran Saleški. Sama
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00498-1912.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00498-1912.xml     > WIKI00498.txt.xml
# WIKI00497: Finžgar, Fran Saleški. Moja duša vasuje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00497-1903.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00497-1903.xml     > WIKI00497.txt.xml
# WIKI00496: Finžgar, Fran Saleški. Iz modernega sveta
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00496-1904.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00496-1904.xml     > WIKI00496.txt.xml
# WIKI00483: Levstik, Vladimir. Za svobodo in ljubezen
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00483-1913.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00483-1913.xml     > WIKI00483.txt.xml
# WIKI00478: Levstik, Vladimir. Gadje gnezdo
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00478-1918.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00478-1918.xml     > WIKI00478.txt.xml
# WIKI00476: Murnik, Rado. Na Bledu
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00476-1917.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00476-1917.xml     > WIKI00476.txt.xml
# WIKI00473: Murnik, Rado. Groga in drugi
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00473-1895.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00473-1895.xml     > WIKI00473.txt.xml
# WIKI00461: Malovrh, Miroslav. Zadnji rodovine Benalja
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00461-1909.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00461-1909.xml     > WIKI00461.txt.xml
# WIKI00460: Malovrh, Miroslav. V študentskih ulicah
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00460-1909.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00460-1909.xml     > WIKI00460.txt.xml
# WIKI00459: Malovrh, Miroslav. Strahovalci dveh kron
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00459-1907.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00459-1907.xml     > WIKI00459.txt.xml
# WIKI00458: Malovrh, Miroslav. Pod novim orlom
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00458-1904.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00458-1904.xml     > WIKI00458.txt.xml
# WIKI00456: Malovrh, Miroslav. Ljubezen in junaštva strahopetnega praporščaka
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00456-1910.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00456-1910.xml     > WIKI00456.txt.xml
# WIKI00455: Malovrh, Miroslav. Kralj Matjaž
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00455-1904.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00455-1904.xml     > WIKI00455.txt.xml
# WIKI00454: Prelesnik, Matija. V smrtni senci
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00454-1904.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00454-1904.xml     > WIKI00454.txt.xml
# WIKI00452: Prelesnik, Matija. Naš stari greh
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00452-1903.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00452-1903.xml     > WIKI00452.txt.xml
# WIKI00425: Gruden, Josip. Na vojvodskem prestolu
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00425-1901.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00425-1901.xml     > WIKI00425.txt.xml
# WIKI00421: Trošt, Ivo. Temni oblaki
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00421-1895.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00421-1895.xml     > WIKI00421.txt.xml
# WIKI00417: Pregelj, Ivan. Tlačani
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00417-1915.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00417-1915.xml     > WIKI00417.txt.xml
# WIKI00410: Cankar, Ivan. Tujci
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00410-1901.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00410-1901.xml     > WIKI00410.txt.xml
# WIKI00406: Tavčar, Ivan. Izza kongresa
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00406-1905.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00406-1905.xml     > WIKI00406.txt.xml
# WIKI00401: Cankar, Ivan. Na klancu
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00401-1902.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00401-1902.xml     > WIKI00401.txt.xml
# WIKI00398: Cankar, Ivan. Martin Kačur
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00398-1906.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00398-1906.xml     > WIKI00398.txt.xml
# WIKI00391: Zbašnik, Fran. Pisana mati
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00391-1909.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00391-1909.xml     > WIKI00391.txt.xml
# WIKI00373: Jaklič, Fran. O, ta testament
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00373-1900.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00373-1900.xml     > WIKI00373.txt.xml
# WIKI00364: Detela, Fran. Novo življenje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00364-1908.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00364-1908.xml     > WIKI00364.txt.xml
# WIKI00363: Detela, Fran. Malo življenje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00363-1882.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00363-1882.xml     > WIKI00363.txt.xml
# WIKI00355: Kraigher, Alojz. Mlada ljubezen
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00355-1917.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00355-1917.xml     > WIKI00355.txt.xml
# WIKI00352: Fatur, Lea. Komisarjeva hči
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00352-1910.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00352-1910.xml     > WIKI00352.txt.xml
# WIKI00345: Levstik, Vladimir. Blagorodje doktor Ambrož Čander
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00345-1909.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00345-1909.xml     > WIKI00345.txt.xml
# WIKI00325: Šorli, Ivo. Štefan Zaplotnik
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00325-1916.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00325-1916.xml     > WIKI00325.txt.xml
# WIKI00324: Tavčar, Ivan. Cvetje v jeseni
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00324-1917.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00324-1917.xml     > WIKI00324.txt.xml
# WIKI00310: Maselj Podlimbarski, Fran. Potresna povest
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00310-1903.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00310-1903.xml     > WIKI00310.txt.xml
# WIKI00279: Jurčič, Josip. Cvet in sad
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00279-1877.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00279-1877.xml     > WIKI00279.txt.xml
# WIKI00278: Detela, Fran. Trojka
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00278-1897.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00278-1897.xml     > WIKI00278.txt.xml
# WIKI00273: Finžgar, Fran Saleški. Kvišku
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00273-1899.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00273-1899.xml     > WIKI00273.txt.xml
# WIKI00240: Pajk, Pavlina. Slučaji usode
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00240-1897.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00240-1897.xml     > WIKI00240.txt.xml
# WIKI00234: Pajk, Pavlina. Dušne borbe
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00234-1896.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00234-1896.xml     > WIKI00234.txt.xml
# WIKI00231: Pajk, Pavlina. Arabela
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00231-1885.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00231-1885.xml     > WIKI00231.txt.xml
# WIKI00227: Pesjak, Luiza. Beatin dnevnik
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00227-1887.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00227-1887.xml     > WIKI00227.txt.xml
# WIKI00217: Jurčič, Josip. Slovenski svetec in učitelj
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00217-1886.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00217-1886.xml     > WIKI00217.txt.xml
# WIKI00216: Jurčič, Josip, Kersnik, Janko. Rokovnjači
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00216-1881.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00216-1881.xml     > WIKI00216.txt.xml
# WIKI00194: Kersnik, Janko. Na Žerinjah
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00194-1876.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00194-1876.xml     > WIKI00194.txt.xml
# WIKI00187: Kersnik, Janko. Agitator
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00187-1885.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00187-1885.xml     > WIKI00187.txt.xml
# WIKI00174: Mencinger, Janez. Abadon
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00174-1893.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00174-1893.xml     > WIKI00174.txt.xml
# WIKI00172: Sket, Jakob. Milko Vogrin
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00172-1883.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00172-1883.xml     > WIKI00172.txt.xml
# WIKI00136: Tavčar, Ivan. 4000
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00136-1891.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00136-1891.xml     > WIKI00136.txt.xml
# WIKI00135: Janežič-Kraljev, Ivan. Gospa s pristave
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00135-1894.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00135-1894.xml     > WIKI00135.txt.xml
# WIKI00132: Maselj Podlimbarski, Fran. Gorski potoki
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00132-1895.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00132-1895.xml     > WIKI00132.txt.xml
# WIKI00126: Jaklič, Fran. Ljudska osveta
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00126-1892.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00126-1892.xml     > WIKI00126.txt.xml
# WIKI00122: Podmilšak, Josip. Žalost in veselje
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00122-1870.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00122-1870.xml     > WIKI00122.txt.xml
# WIKI00112: Detela, Fran. Veliki grof
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00112-1885.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00112-1885.xml     > WIKI00112.txt.xml
# WIKI00111: Detela, Fran. Pegam in Lambergar
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00111-1891.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00111-1891.xml     > WIKI00111.txt.xml
# WIKI00103: Koder, Anton. Zvezdana
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00103-1883.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00103-1883.xml     > WIKI00103.txt.xml
# WIKI00099: Koder, Anton. Marjetica
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00099-1877.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00099-1877.xml     > WIKI00099.txt.xml
# WIKI00098: Koder, Anton. Luteranci
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00098-1883.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00098-1883.xml     > WIKI00098.txt.xml
# WIKI00094: Bartel, Anton. Pomladanski vetrovi
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00094-1881.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00094-1881.xml     > WIKI00094.txt.xml
# WIKI00092: Štrukelj, Ivan. Zmota in povrat
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00092-1892.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00092-1892.xml     > WIKI00092.txt.xml
# WIKI00090: Štrukelj, Ivan. Spletke
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00090-1894.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00090-1894.xml     > WIKI00090.txt.xml
# WIKI00072: Meško, Ksaver. Kam plovemo
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00072-1897.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00072-1897.xml     > WIKI00072.txt.xml
# WIKI00058: Kersnik, Janko. Ciklamen
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00058-1883.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00058-1883.xml     > WIKI00058.txt.xml
# WIKI00048: Govekar, Fran. V krvi
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00048-1896.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00048-1896.xml     > WIKI00048.txt.xml
# WIKI00024: Bedenek, Jakob. Od pluga do krone
unzip IMP-dl-tei.zip     IMP-dl-tei/WIKI00024-1891.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:../Scripts/id_p.xsl IMP-dl-tei/WIKI00024-1891.xml     > WIKI00024.txt.xml
rm IMP-dl-tei.zip
rm -r IMP-dl-tei
rm IMP-corpus-tei.zip
rm -r IMP-corpus-tei
