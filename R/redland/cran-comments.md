## Test environments

 * macOS 10.14.6: R 4.0.2
 * Ubuntu 18.04.5 LTS R version 3.4.4 (2018-03-15)
 * Windows (via win-builder): x86_64-w64-mingw32 (64-bit) R version 4.0.2 (2020-06-22)
 * Windows (via win-builder): x86_64-w64-mingw32 (64-bit) R Under development (unstable) (2020-09-17 r79226)
 * Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R version 3.6.3 (2020-02-29)
 * Fedora Linux (via rhub), R-devel, clang, gfortran
 * Windows Server 2008 R2 SP1 (via rhub), R-devel, 32/64 bit
 * Debian Linux (via rhub), R-devel, GCC
 * Fedora Linux (via rhub), R-devel, GCC
 * Ubuntu Linux 16.04 LTS (via rhub), R-release, GCC
 * macOS 10.13.6 High Sierra (via rhub), R-release
 * Windows Server 2008 R2 SP1, R-devel (via rhub), 32/64 bit
 * Windows Server 2008 R2 SP1, R-oldrel (via rhub), 32/64 bit
 * Windows Server 2008 R2 SP1, R-release (via rhub), 32/64 bit

## Changes since last release

* All CRAN check errors for the 1.0.17-12 release have been resolved (#89)

## R CMD check results

* There were no ERRORs.
* There were several WARNINGS, all of which originate in the upstream librdf code library which is 
  being wrapped in R, and so are not due to the code in this package.
* There was a WARNING regarding Possibly mis-spelled words in DESCRIPTION:
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
