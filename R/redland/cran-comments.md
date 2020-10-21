## Test environments

 * macOS 10.14.6: R 4.0.2
 * macOS 10.13.6 High Sierra (via rhub), R-release
 * macOS 10.13.6 High Sierra, CRAN setup (via rhub), R-release

## Changes since last release

* Resolved errors during installation that occurred only on macOS. (#91)
  - Note: all other platforms passed the CRAN checks.

## R CMD check results

* There were no ERRORs.
* There were several WARNINGS, all of which originate in the upstream librdf code library which is 
  being wrapped in R, and so are not due to the code in this package.
* There was a WARNING regarding possibly misspelled words in DESCRIPTION:
      RDF (3:8, 17:51, 17:57, 18:27, 18:77, 19:69)
      Redland (18:69)
  * These terms are briefly explained in the DESCRIPTION, with URLs that provide a complete description.
* There were the following NOTES: 
  - A NOTE regarding "sub-directories of 1Mb or more" for the libs directory.
    For the Windows builds only, the "libs" directory contains only the redland.dll 
    files build for each Windows sub-architecture (i385, x64) and is necessary for 
    the redland package to run.

## Downstream dependencies

* The downstream dependencies (datapack, rdflib) have been checked with revdepcheck::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes.
