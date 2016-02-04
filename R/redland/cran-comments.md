
## Test environments

* OS X 10.10.5, R 3.2.3
* Ubuntu 14.04, R 3.2.3 
* Debian (via Docker) R Under development (unstable) (2016-01-11 r69918)
* Windows 7, R 3.1.1, R 3.2.3
* Windows 8, R 3.1.1
* Windows 10, R 3.1.1, R 3.2.3

## R CMD check results

* There were no ERRORs or WARNINGs.
* There were the following 2 NOTES: 
  - A NOTE checking CRAN incoming feasibility:
    - indicating that this is a new submission.
    - indicating possible mispelled words in the DESCRIPTION. These have been checked
      and are either valid acronyms or proper names:
      - API (13:33)
      - RDF (3:8, 11:51)
      - Redland (12:26)
      - librdf (12:34, 13:44)
    - indicating (possibly) invalid DOI: doi:10.5063/F1VM496B 
      This DOI is currently reserved from EZID and will be made public when this 
      package is submitted to CRAN.
  - A NOTE regarding "sub-directories of 1Mb or more" for the libs directory.
    For the Windows builds only, the "libs" directory contains only the redland.dll 
    files build for each Windows sub-architecture (i385, x64) and is necessary for 
    the redland package to run.
 
## Downstream dependencies

* Initial release, so no downstream dependencies
