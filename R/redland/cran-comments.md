## Test environments

R-release:

* Winbuilder: x86_64-w64-mingw32 (64-bit) R version 4.3.2 (2023-10-31 ucrt)
* Ubuntu Linux 22.04 LTS, R 4.3.1, GCC
* macOS Ventura 13.5.2: R version 4.3.1 (2023-06-16)
    * using platform: aarch64-apple-darwin20 (64-bit)
    * R was compiled by
       * Apple clang version 14.0.0 (clang-1400.0.29.202)
       * GNU Fortran (GCC) 12.2.0
* R-hub Ubuntu Linux 20.04.1 LTS, R-release, GCC

R-devel:

* Winbuilder: x86_64-w64-mingw32 R Under development (unstable) (2024-02-22 r85974 ucrt)
* R-hub Ubuntu Linux 20.04.1 LTS, R-devel, GCC

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
✔ datapack 1.4.2                         [ FAIL 0 | WARN 0 | SKIP 0 | PASS 344 ]
✔ rdflib 0.2.8                           [ FAIL 0 | WARN 0 | SKIP 6 | PASS 55 ]   
```

