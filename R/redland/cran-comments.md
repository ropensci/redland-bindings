
## Test environments

* OS X 10.11.5, R 3.3.2
* Ubuntu 14.04, R 3.3.2 
* Windows 7, R 3.3.2
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R 3.3.2 and R unstable (2016-12-14 r71786)

## Problems fixed in this build

* Added an installation cleanup script

* Vignettes now build with R 3.4.0 and are now updated to the ./doc directory by package installation.

## R CMD check results

* There were no ERRORs.
* There were several WARNINGS, all of which originate in the upstream librdf code library
  which is being wrapped in R, and so are not due to the code in this package.
* There were the following 2 NOTES: 
  - A NOTE checking CRAN incoming feasibility:
    - indicating possible mispelled words in the DESCRIPTION. These have been checked
      and are either valid acronyms or proper names:
      - RDF (3:8, 17:51, 17:57, 18:27, 18:77, 19:69)
      - Redland (18:69)
  - A NOTE regarding "sub-directories of 1Mb or more" for the libs directory.
    For the Windows builds only, the "libs" directory contains only the redland.dll 
    files build for each Windows sub-architecture (i385, x64) and is necessary for 
    the redland package to run.
 
## Downstream dependencies

* The downstream dependencies (datapack) have been checked with devtools::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes.
