
## Test environments

* OS X 10.10.5, R 3.2.3
* Ubuntu 14.04, R 3.2.3 
* Windows 7 (i386, x86_64), R 3.1.1, R 3.2.4, R 3.3.0 beta (2016-04-17 r70499)

## Problems fixed in this build

* Mac OS X binary builds now create a redland.so file that does not
  librdf.0.dylib during package load but instead links this library in
  statically, to make package installation easier for the user.
  
* Fixed an unresolved symbol issue during builds on Windows (32 bit only) with R 3.3.0 beta

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

* The downstream dependency 'datapack' has been tested with this release.
