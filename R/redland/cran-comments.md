## Test environments

R-release:

* macOS Big Sur 11.6.6: R version 4.3.0 (2023-04-21)
    * using platform: x86_64-apple-darwin20 (64-bit)
    * Apple clang version 14.0.3 (clang-1403.0.22.14.1), GNU Fortran (GCC) 12.2.0
* R-hub Ubuntu Linux 20.04.1 LTS, R-release, GCC
* R-hub Windows Server 2022, R-release, 32/64 bit
* Winbuilder: x86_64-w64-mingw32 (64-bit) 4.3.0 (2023-04-21 ucrt)
    * gcc.exe (GCC) 12.2.0
    * GNU Fortran (GCC) 12.2.0
    * Windows Server 2022 x64 (build 20348)

R-devel:

* R-hub Fedora Linux, R-devel, clang, gfortran
* R-hub Debian Linux, R-devel, GCC ASAN/UBSAN
* R-hub Windows Server 2022, R-devel, 64 bit
* Winbuilder: x86_64-w64-mingw32 (64-bit) using R Under development (unstable) (2023-05-19 r84451 ucrt)
    * gcc.exe (GCC) 12.2.0
    * GNU Fortran (GCC) 12.2.0
    * Windows Server 2022 x64 (build 20348)

## Changes since last release

* fix compiler warnings that CRAN is no longer tolerating from SWIG (#100)
* fix NOTE "Found if() conditions comparing class() to string" (#100)
* fix Roxygen2 roclet build issues (#100)
* Fix various spelling words that were flagged (#100)
* Fix URLs that were reported as moved (#100)

## R CMD check results

* There were no ERRORs, WARNINGs, or NOTEs on the rhub builds on all platforms, nor on Winbuilder releases, nor on MacOS with R-release.
* All problems on the CRAN package check are now fixed and passing in these builds.

## Downstream dependencies

* The downstream dependencies (datapack, rdflib) have been checked with revdepcheck::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes.

```txt
> revdep_summary()
✔ datapack 1.4.1                         ── E: 0     | W: 0     | N: 0    
✔ rdflib 0.2.6                           ── E: 0     | W: 0     | N: 0    
```

