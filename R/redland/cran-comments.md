## Test environments

* macOS 11.6: R 4.1.1
* Winbuilder: x86_64-w64-mingw32 (64-bit) using R Under development (unstable) (2021-12-14 r81376 ucrt)
* Winbuilder: x86_64-w64-mingw32 (64-bit) using R version 4.1.2 (2021-11-01)
* R-hub windows-x86_64-devel (r-devel)

## Changes since last release

* Resolved UCRT build issues for Windows builds under Rtools42 (#93)

## R CMD check results

* There were no ERRORs, WARNINGs, or NOTEs on the rhub builds on all platforms, nor on Winbuilder release.
* ON winbuilder R-devel, there was 1 warning regarding the UCRT patch, which failed to apply 
  because we already applied that patch to the package as instructed. Once the UCRT autopatch is removed from the CRAN
  build process this warning should disappear.
* The CRAN package check page shows one NOTE abouut the `libs` folder being too large, but this is due to the 
  included redland librdf library binaries that this package wraps.

## Downstream dependencies

* The downstream dependencies (datapack, rdflib) have been checked with revdepcheck::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes. Maintainers from those packages have been notified.
