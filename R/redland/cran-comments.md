## Test environments

R-release:

* Ubuntu Linux 22.04 LTS, R 4.3.1, GCC
* Winbuilder: x86_64-w64-mingw32 (64-bit) R version 4.3.2 (2023-10-31 ucrt)

* macOS Big Sur 11.6.6: R version 4.3.0 (2023-04-21)
    * using platform: x86_64-apple-darwin20 (64-bit)
    * Apple clang version 14.0.3 (clang-1403.0.22.14.1), GNU Fortran (GCC) 12.2.0
* R-hub Ubuntu Linux 20.04.1 LTS, R-release, GCC
* R-hub Windows Server 2022, R-release, 32/64 bit

R-devel:

* Winbuilder: x86_64-w64-mingw32 R Under development (unstable) (2024-02-22 r85974 ucrt)

* R-hub Fedora Linux, R-devel, clang, gfortran
* R-hub Debian Linux, R-devel, GCC ASAN/UBSAN
* R-hub Windows Server 2022, R-devel, 64 bit


## Changes since last release

* Fix for ucrt on arm64 (#102)
* Documentation and link fixes

## R CMD check results

* There were no NOTES, ERRORs or WARNINGs on all builds.
* All problems on the CRAN package check are now fixed and passing in these builds.
* All NOTES from the package check page are now fixed.

## Downstream dependencies

* The downstream dependencies (datapack, rdflib) have been checked with revdepcheck::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes.

```txt
> revdep_summary()
✔ datapack 1.4.1                         ── E: 0     | W: 0     | N: 0    
✔ rdflib 0.2.6                           ── E: 0     | W: 0     | N: 0    
```

