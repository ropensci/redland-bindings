
## Test environments

* macOS 10.13.4, R 3.5, 3.5.1
* Ubuntu 16.04, R 3.4.4
* Ubuntu 17.10, R 3.4.2
* Debian 9.4.0 R Under development (unstable) (2018-06-18 r74910)
* Windows 7, R 3.4.2, R 3.5
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R version 3.4.4 (2018-03-15)
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R version 3.5.1 (2018-07-02)
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R Under development (unstable) (2018-07-12 r74955)

## Changes since last release

* Fixes for homebrew (#51)
* An RDF language tag can now be specified for literal nodes (#64)
* Added ability to retrieve all query results at once. (#58)
* Added new function getNodeValue() (#65)
* Added new function getResults() (#58)
* Added new function writeResults() (#58)

## R CMD check results

* There were no ERRORs.
* There were several WARNINGS, all of which originate in the upstream librdf code library
  which is being wrapped in R, and so are not due to the code in this package.
* There was the following 1 NOTE: 
  - A NOTE regarding "sub-directories of 1Mb or more" for the libs directory.
    For the Windows builds only, the "libs" directory contains only the redland.dll 
    files build for each Windows sub-architecture (i385, x64) and is necessary for 
    the redland package to run.
 
## Downstream dependencies

* The downstream dependencies (datapack, rdflib) have been checked with devtools::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes.
