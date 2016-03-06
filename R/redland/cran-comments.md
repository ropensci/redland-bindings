
## Test environments

* OS X 10.10.5, R 3.2.3
* Ubuntu 14.04, R 3.2.3 
* Windows 7, R 3.1.1, R 3.2.3

## R CMD check results

* There were no ERRORs.
* There were several WARNINGS, all of which originate in the upstream librdf code library
  which is being wrapped in R, and so are not due to the code in this package.
* There were the following 2 NOTES: 
  - A NOTE checking CRAN incoming feasibility:
    - indicating possible mispelled words in the DESCRIPTION. These have been checked
      and are either valid acronyms or proper names:
      - RDF (3:8, 12:51, 12:57, 13:27, 13:77, 14:69)
      - Redland (13:69)
  - A NOTE regarding "sub-directories of 1Mb or more" for the libs directory.
    For the Windows builds only, the "libs" directory contains only the redland.dll 
    files build for each Windows sub-architecture (i385, x64) and is necessary for 
    the redland package to run.
 
## Downstream dependencies

* Currently there are no downstream dependencies
