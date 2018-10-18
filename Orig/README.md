# ELTeC-slv

This is the Workflow I used for converting the initial batch of Slovenian texts

- Marko gave me a list of relevant titles, in Word. I converted that to XML using docxtotei

- I  processed the list result with `makegrab.xsl` to produce a shell script (`grab`) which downloaded each relevant file, using syntax like this:
~~~~
curl http://nl.ijs.si/imp/dl/xml/WIKI00293-1855.xml> 00293.xml
~~~~
- Each file was converted using `retag.xsl` which does most of what's necessary (remove tags we are not using, simplify header etc.)

- Shell script `doSizes` was used to create an auxiliary file containing the word count (`sizes.xml`) for each file

- Script `fixmetdata.xsl` was run over each file, primarily to enhance the TEI header using the file made in the previous step; it also fixed a couple of things I'd missed when running retag.xsl (e.g. use of `<choice>`)

