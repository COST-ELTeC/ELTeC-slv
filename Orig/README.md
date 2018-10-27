# ELTeC-slv

Folder for the original Slovene data (all available input formats and transformation scripts).

Workflow used for converting the initial batch of Slovenian texts which come from the [IMP Digital library](http://nl.ijs.si/imp/index-en.html):

1. The current list of titles, together with IDs and ELTeC-specific metadata missing from the IMP originals is in `slv-index-imp.txt`;

2. The list is first processed with `grab-imp.pl` which generates `grab-imp.sh`, a shell script that downloads the XMLs from the CLARIN.SI repository and stores them locally;

3. The IMP files are then run through `add-meta-imp.pl` which adds `slv-index-imp.txt` metadata to them and also renames the files to the ELTeC schema. It also calculates the number of words and adds it to the file.

4. These files are then converted by `fix-tags-imp.xsl` to make the encoding compliant with ELTeC Level-1.

5. Steps 3 and 4 can be performed for all the files with the script `imp2eltec.pl`. How to run this script and 1 and 2 is exemplified in the `Makefile` and can be run together with the command `make all` (assuming the necessary programs and installed in the same directories as expected).
