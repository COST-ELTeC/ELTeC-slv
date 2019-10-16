# ELTeC-slv

Folder for the original Slovene data from Wikisource, either directly or through the IMP corpus. Included are download and transformation scripts.

Workflow used for converting the initial batch of Slovenian texts which come from the [IMP Digital library](http://nl.ijs.si/imp/index-en.html):

1. The current master table of the novels together with IDs and ELTeC-specific metadata missing from the IMP originals is in `slv-index-imp.txt`;

2. The list is first processed with `grab-imp.pl` which generates `grab-imp.sh`, a shell script that downloads the XMLs from the CLARIN.SI repository and stores them locally (based on LB's pipeline);

3. Each IMP file is run through `add-meta-imp.pl` which adds `slv-index-imp.txt` metadata to it and calculates the number of words and adds this count to the TEI file.

4. Each file is then converted by `fix-tags-imp.xsl` to make the encoding compliant with ELTeC Level-1.

5. Steps 3 and 4 can be performed for all the files together, including validation agains the ELTeC schema with the script `imp2eltec.pl`. How to run this script and 1 and 2 is exemplified in the `Makefile`. To run the complete process type `make all` in this directory (assuming the necessary programs and installed in the same directories as expected).

== Work in progress ==

* do the same for WikiSource texts.

Some (maybe old versions) have been downloaded into Wiki/ as mark-down
files.

TEI Stylesheets include the markdowntotei conversion (the Stylesheets
are .gitignored here) but it has to be tweaked as Wiki MD uses
different style of heading markup (== line this ==). The profile is in
`Scripts/profiles`.
