
## Test environments

* OS X 10.10.5, R 3.2.3
* Ubuntu 14.04, R 3.2.3 
* Debian (via Docker) R Under development (unstable) (2016-01-11 r69918)
* Windows 7, R 3.1.1, R 3.2.3
* Windows 8, R 3.1.1
* Windows 10, R 3.1.1, R 3.2.3

## R CMD check results

* There were no ERRORs or WARNINGs.
* There were two NOTES: 
  * one indicating that this is a new submission.
  * For the Windows build only, one NOTE regarding "sub-directories of 1Mb or more"
    The "libs" directory contains only the redland.dll files build for each Windows
    sub-architecture (i385, x64) and is necessary for the redland package to run.

## Downstream dependencies

* Initial release, so no downstream dependencies
