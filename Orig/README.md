# ELTeC-slv

Folder for the original Slovene data from [Wikivir](https://sl.wikisource.org/) either
directly or via the [IMP Digital Library](http://hdl.handle.net/11356/1031). Included
are download and transformation scripts.

## Conversion process

All the scripts are in the `Scripts/` directory, which also includes a `Makefile`. Run
`make all` to download all the source files from the web, add to them ELTeC metadata
and covert them to ELTeC level-1 encoding. The source files are stored in dedicated
directories, one per source (currently `IMP` and `Wiki`, which are gitignored. The
scripts assume some installed programs, in particular Perl, Java and Saxon - the paths
to some of these might need to be changed.

The ELTeC metadata is in the file `slv-index.txt` which is a TSV file directly exported
from the master Excel spreadsheet. `slv-authors.txt` contains the VIAF or CONOR codes
of the authors of the novels.

The conversion process is then roughly as follows:

1. A Perl script first takes the URLs from the index and generates a bash script to
download and (for Wiki source) pre-process them.

2. Metadata from the index is then added to each file, and the resulting file tweeked
to conform to ELTeC level-1 schema

3. The files are validated according to the ELTeC level-1 schema, assumed to be cloned
to `Schemas` as a sister directory to `ELTeC-slv`.


TEI Stylesheets include the markdowntotei conversion (the Stylesheets
are .gitignored here) but it has to be tweaked as Wiki MD uses
different style of heading markup (== like this ==). The profile is in
`Scripts/profiles`.
