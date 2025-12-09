Dear CRAN maintainers,

Please find below the CRAN submission comments for the redland R package version 1.0.17-19. This release fixes documentation issues and I replaced the non-API call to ‘SET_S4_OBJECT’ that had been causing problems with the CRAN check results. All checks are now succeeding for me on the platforms below.

Best,
Matt

## Test environments

* Windows (via win-builder): x86_64-w64-mingw32 (64-bit) R version 4.5.2 (2025-10-31 ucrt)
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit) R Under development (unstable) (2025-12-08 r89124 ucrt)
* macOS Sequoia 15.7.2: aarch64-apple-darwin20 R version 4.5.2 (2025-10-31)
* macOS Ventura 13.7.6: aarch64-apple-darwin20 R version 4.5.2 (2025-10-31)
* Ubuntu 24.04.3 LTS: x86_64-pc-linux-gnu R version 4.5.2 (2025-10-31)
* Ubuntu 24.04.3 LTS: x86_64-pc-linux-gnu R version 4.4.3 (2025-02-28)
* Ubuntu 24.04.3 LTS: x86_64-pc-linux-gnu R Under development (unstable) (2025-12-08 r89124)

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

