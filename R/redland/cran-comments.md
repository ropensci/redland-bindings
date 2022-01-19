## Test environments

* macOS 11.6.2: R 4.1.2
* Winbuilder: x86_64-w64-mingw32 (64-bit) using R Under development (unstable) (2022-01-17 r81511 ucrt)
* Winbuilder: x86_64-w64-mingw32 (64-bit) R version 4.1.2 (2021-11-01)
* R-hub Windows Server 2022, R-devel, 64 bit
* R-hub Windows Server 2008 R2 SP1, R-release, 32/64 bit
* R-hub Ubuntu Linux 20.04.1 LTS, R-release, GCC
* R-hub Fedora Linux, R-devel, clang, gfortran
* R-hub Debian Linux, R-devel, GCC ASAN/UBSAN
## Changes since last release

* Resolved package compile warnings (e.g. "-Wpointer-sign") (#96)

## R CMD check results

* There were no ERRORs, WARNINGs, or NOTEs on the rhub builds on all platforms, nor on Winbuilder release.
* The CRAN package check page shows one NOTE about the `libs` folder being too large, but this is due to the 
  included redland librdf library binaries that this package wraps.

## Downstream dependencies

* The downstream dependencies (datapack, rdflib) have been checked with revdepcheck::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes. Maintainers from those packages have been notified.
