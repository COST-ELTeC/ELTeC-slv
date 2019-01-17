# ELTeC-slv

Folder for the original Slovene data from Wikisource, either directly or through the IMP corpus together with download and transformation scripts).

Workflow used for converting the initial batch of Slovenian texts which come from the [IMP Digital library](http://nl.ijs.si/imp/index-en.html):

1. The current list of titles, together with IDs and ELTeC-specific metadata missing from the IMP originals is in `slv-index-imp.txt`;

2. The list is first processed with `grab-imp.pl` which generates `grab-imp.sh`, a shell script that downloads the XMLs from the CLARIN.SI repository and stores them locally;

3. Each IMP file is then run through `add-meta-imp.pl` which adds `slv-index-imp.txt` metadata to it and calculates the number of words in it and adds this count to the TEI file.

4. Each file is then converted by `fix-tags-imp.xsl` to make the encoding compliant with ELTeC Level-1.

5. Steps 3 and 4 can be performed for all the files together, including validation agains the ELTeC schema with the script `imp2eltec.pl`. How to run this script and 1 and 2 is exemplified in the `Makefile`. To run the complete process type `make all` in this directory (assuming the necessary programs and installed in the same directories as expected).

== Work in progress ==

* do the same for WikiSource texts.

They have now been downloaded into Wiki/ as mark-down files. However,
it turns out to be difficult to find something close to md2tei. Do
HTML instead? However, that is very messy.
