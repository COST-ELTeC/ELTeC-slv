### Grab selected WikiVir books and prepare them for ElTeC
cd ../Wiki
rm -f *
# SLV10032 / Z_viharja_v_zavetje: Zbašnik, Fran. Z viharja v zavetje
wget -q -O 'Z_viharja_v_zavetje.md' 'https://sl.wikisource.org/w/index.php?title=Z_viharja_v_zavetje&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Z_viharja_v_zavetje.md' > SLV10032.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10032.md
# SLV10031 / Brambovci: Lah, Ivan. Brambovci
wget -q -O 'Brambovci.md' 'https://sl.wikisource.org/w/index.php?title=Brambovci&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Brambovci.md' > SLV10031.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10031.md
# SLV10030 / Svitanje_(Fran_Govekar): Govekar, Fran. Svitanje
wget -q -O 'Svitanje_(Fran_Govekar).md' 'https://sl.wikisource.org/w/index.php?title=Svitanje_(Fran_Govekar)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Svitanje_(Fran_Govekar).md' > SLV10030.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10030.md
# SLV10029 / Ro%C5%A1lin_in_Vrjanko: Kersnik, Janko. Rošlin in Vrjanko
wget -q -O 'Ro%C5%A1lin_in_Vrjanko.md' 'https://sl.wikisource.org/w/index.php?title=Ro%C5%A1lin_in_Vrjanko&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Ro%C5%A1lin_in_Vrjanko.md' > SLV10029.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10029.md
# SLV10028 / Pobratimi: Vošnjak, Josip. Pobratimi
wget -q -O 'Pobratimi.md' 'https://sl.wikisource.org/w/index.php?title=Pobratimi&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Pobratimi.md' > SLV10028.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10028.md
# SLV10027 / Libera_nos_a_malo: Vodeb, Emil. Libera nos a malo
wget -q -O 'Libera_nos_a_malo.md' 'https://sl.wikisource.org/w/index.php?title=Libera_nos_a_malo&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Libera_nos_a_malo.md' > SLV10027.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10027.md
# SLV10026 / Viso%C5%A1ka_kronika: Tavčar, Ivan. Visoška kronika
wget -q -O 'Viso%C5%A1ka_kronika.md' 'https://sl.wikisource.org/w/index.php?title=Viso%C5%A1ka_kronika&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Viso%C5%A1ka_kronika.md' > SLV10026.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10026.md
# SLV10025 / Gospod_Mirodolski: Stritar, Josip. Gospod Mirodolski
wget -q -O 'Gospod_Mirodolski.md' 'https://sl.wikisource.org/w/index.php?title=Gospod_Mirodolski&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Gospod_Mirodolski.md' > SLV10025.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10025.md
# SLV10024 / Sodnikovi: Stritar, Josip. Sodnikovi
wget -q -O 'Sodnikovi.md' 'https://sl.wikisource.org/w/index.php?title=Sodnikovi&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Sodnikovi.md' > SLV10024.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10024.md
# SLV10023 / Zorin: Stritar, Josip. Zorin
wget -q -O 'Zorin.md' 'https://sl.wikisource.org/w/index.php?title=Zorin&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Zorin.md' > SLV10023.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10023.md
# SLV10022 / Mina_(Albin_Prepeluh): Prepeluh, Albin. Mina
wget -q -O 'Mina_(Albin_Prepeluh).md' 'https://sl.wikisource.org/w/index.php?title=Mina_(Albin_Prepeluh)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Mina_(Albin_Prepeluh).md' > SLV10022.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10022.md
# SLV10021 / Judita_(Pavlina_Pajk): Pajk, Pavlina. Judita
wget -q -O 'Judita_(Pavlina_Pajk).md' 'https://sl.wikisource.org/w/index.php?title=Judita_(Pavlina_Pajk)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Judita_(Pavlina_Pajk).md' > SLV10021.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10021.md
# SLV10020 / Fata_morgana_(Marica_Nadli%C5%A1ek_Bartol): Nadlišek, Marica. Fata morgana
wget -q -O 'Fata_morgana_(Marica_Nadli%C5%A1ek_Bartol).md' 'https://sl.wikisource.org/w/index.php?title=Fata_morgana_(Marica_Nadli%C5%A1ek_Bartol)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Fata_morgana_(Marica_Nadli%C5%A1ek_Bartol).md' > SLV10020.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10020.md
# SLV10019 / Pti%C4%8Dki_brez_gnezda: Milčinski, Fran. Ptički brez gnezda
wget -q -O 'Pti%C4%8Dki_brez_gnezda.md' 'https://sl.wikisource.org/w/index.php?title=Pti%C4%8Dki_brez_gnezda&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Pti%C4%8Dki_brez_gnezda.md' > SLV10019.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10019.md
# SLV10018 / Gospodin_Franjo: Maselj Podlimbarski, Fran. Gospodin Franjo
wget -q -O 'Gospodin_Franjo.md' 'https://sl.wikisource.org/w/index.php?title=Gospodin_Franjo&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Gospodin_Franjo.md' > SLV10018.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10018.md
# SLV10017 / Tolovajski_glavar_%C4%8Crni_Jurij_in_njegovi_divji_tovari%C5%A1i,_1._del: Malovrh, Miroslav. Tolovajski glavar Črni Jurij in njegovi divji tovariši
wget -q -O 'Tolovajski_glavar_%C4%8Crni_Jurij_in_njegovi_divji_tovari%C5%A1i,_1._del.md' 'https://sl.wikisource.org/w/index.php?title=Tolovajski_glavar_%C4%8Crni_Jurij_in_njegovi_divji_tovari%C5%A1i,_1._del&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Tolovajski_glavar_%C4%8Crni_Jurij_in_njegovi_divji_tovari%C5%A1i,_1._del.md' > SLV10017.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10017.md
# SLV10016 / Zadnji_samotar: Mahnič, Anton. Zadnji samotar
wget -q -O 'Zadnji_samotar.md' 'https://sl.wikisource.org/w/index.php?title=Zadnji_samotar&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Zadnji_samotar.md' > SLV10016.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10016.md
# SLV10015 / Njeno_%C5%BEivljenje: Kveder, Zofka. Njeno življenje
wget -q -O 'Njeno_%C5%BEivljenje.md' 'https://sl.wikisource.org/w/index.php?title=Njeno_%C5%BEivljenje&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Njeno_%C5%BEivljenje.md' > SLV10015.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10015.md
# SLV10014 / Nada_(Zofka_Kveder): Kveder, Zofka. Nada
wget -q -O 'Nada_(Zofka_Kveder).md' 'https://sl.wikisource.org/w/index.php?title=Nada_(Zofka_Kveder)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Nada_(Zofka_Kveder).md' > SLV10014.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10014.md
# SLV10013 / Mladi_gozdar: Kovačič, Ivo. Mladi gozdar
wget -q -O 'Mladi_gozdar.md' 'https://sl.wikisource.org/w/index.php?title=Mladi_gozdar&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Mladi_gozdar.md' > SLV10013.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10013.md
# SLV10012 / Kmetski_triumvirat: Koder, Anton. Kmetski triumvirat
wget -q -O 'Kmetski_triumvirat.md' 'https://sl.wikisource.org/w/index.php?title=Kmetski_triumvirat&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Kmetski_triumvirat.md' > SLV10012.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10012.md
# SLV10011 / Lepa_Vida_(Josip_Jur%C4%8Di%C4%8D): Jurčič, Josip. Lepa Vida
wget -q -O 'Lepa_Vida_(Josip_Jur%C4%8Di%C4%8D).md' 'https://sl.wikisource.org/w/index.php?title=Lepa_Vida_(Josip_Jur%C4%8Di%C4%8D)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Lepa_Vida_(Josip_Jur%C4%8Di%C4%8D).md' > SLV10011.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10011.md
# SLV10010 / Ivan_Erazem_Tatenbah: Jurčič, Josip. Ivan Erazem Tatenbah
wget -q -O 'Ivan_Erazem_Tatenbah.md' 'https://sl.wikisource.org/w/index.php?title=Ivan_Erazem_Tatenbah&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Ivan_Erazem_Tatenbah.md' > SLV10010.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10010.md
# SLV10009 / Doktor_Zober: Jurčič, Josip. Doktor Zober
wget -q -O 'Doktor_Zober.md' 'https://sl.wikisource.org/w/index.php?title=Doktor_Zober&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Doktor_Zober.md' > SLV10009.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10009.md
# SLV10008 / Med_dvema_stoloma: Jurčič, Josip. Med dvema stoloma
wget -q -O 'Med_dvema_stoloma.md' 'https://sl.wikisource.org/w/index.php?title=Med_dvema_stoloma&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Med_dvema_stoloma.md' > SLV10008.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10008.md
# SLV10007 / Deseti_brat_(Josip_Jur%C4%8Di%C4%8D): Jurčič, Josip. Deseti brat
wget -q -O 'Deseti_brat_(Josip_Jur%C4%8Di%C4%8D).md' 'https://sl.wikisource.org/w/index.php?title=Deseti_brat_(Josip_Jur%C4%8Di%C4%8D)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Deseti_brat_(Josip_Jur%C4%8Di%C4%8D).md' > SLV10007.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10007.md
# SLV10006 / %C5%BDena_(Vitomir_Feodor_Jelenc): Jelenc, Vitomir Feodor. Žena
wget -q -O '%C5%BDena_(Vitomir_Feodor_Jelenc).md' 'https://sl.wikisource.org/w/index.php?title=%C5%BDena_(Vitomir_Feodor_Jelenc)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < '%C5%BDena_(Vitomir_Feodor_Jelenc).md' > SLV10006.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10006.md
# SLV10005 / Pod_svobodnim_soncem: Finžgar, Fran Saleški. Pod svobodnim soncem
wget -q -O 'Pod_svobodnim_soncem.md' 'https://sl.wikisource.org/w/index.php?title=Pod_svobodnim_soncem&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Pod_svobodnim_soncem.md' > SLV10005.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10005.md
# SLV10004 / Nebesa_(Ivan_Fajdiga): Fajdiga, Ivan. Nebesa
wget -q -O 'Nebesa_(Ivan_Fajdiga).md' 'https://sl.wikisource.org/w/index.php?title=Nebesa_(Ivan_Fajdiga)&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Nebesa_(Ivan_Fajdiga).md' > SLV10004.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10004.md
# SLV10003 / Sre%C4%8Da_v_nesre%C4%8Di_ali_popisovanje_%C4%8Dudne_zgodbe_dveh_dvoj%C4%8Dkov: Cigler, Janez. Sreča v nesreči
wget -q -O 'Sre%C4%8Da_v_nesre%C4%8Di_ali_popisovanje_%C4%8Dudne_zgodbe_dveh_dvoj%C4%8Dkov.md' 'https://sl.wikisource.org/w/index.php?title=Sre%C4%8Da_v_nesre%C4%8Di_ali_popisovanje_%C4%8Dudne_zgodbe_dveh_dvoj%C4%8Dkov&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Sre%C4%8Da_v_nesre%C4%8Di_ali_popisovanje_%C4%8Dudne_zgodbe_dveh_dvoj%C4%8Dkov.md' > SLV10003.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10003.md
# SLV10002 / Zadnji_dnevi_v_Ogleju: Carli Lukovič, Alojz. Zadnji dnevi v Ogleju
wget -q -O 'Zadnji_dnevi_v_Ogleju.md' 'https://sl.wikisource.org/w/index.php?title=Zadnji_dnevi_v_Ogleju&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Zadnji_dnevi_v_Ogleju.md' > SLV10002.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10002.md
# SLV10001 / Hi%C5%A1a_Marije_Pomo%C4%8Dnice: Cankar, Ivan. Hiša Marije Pomočnice
wget -q -O 'Hi%C5%A1a_Marije_Pomo%C4%8Dnice.md' 'https://sl.wikisource.org/w/index.php?title=Hi%C5%A1a_Marije_Pomo%C4%8Dnice&action=raw'
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/fix-text-wiki.pl < 'Hi%C5%A1a_Marije_Pomo%C4%8Dnice.md' > SLV10001.md
/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/Stylesheets/bin/markdowntotei --profiledir=/home/tomaz/Project/COST-Distant/ELTec/ELTeC-slv/Orig/Scripts/profiles  SLV10001.md
