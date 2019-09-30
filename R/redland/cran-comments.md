
## Test environments

* macOS 10.14.5, R 3.6.1
* Ubuntu 19.04, R 3.6.1
* Windows 7, R 3.6.1, R 3.6.1
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R version 3.5.3 (2019-03-11)
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R version 3.6.1 (2019-07-05)
* Windows (via win-builder): x86_64-w64-mingw32 (64-bit), R Under development (unstable) 2019-09-27 r77229

## Changes since last release

* Removed deprecated function warnings during package build. (#79)
* Fix memory protection problems reported by 'rchk'. (#78)
* Deprecate the 'getNextResult' function. (#79)

## R CMD check results

* There were no ERRORs.
* There was the following 1 WARNING:
  - "'librdf_node_to_string' is deprecated (declared at ../windows/redland-1.0.17/include/rdf_node.h:171)"
    This librdf C library function is used by the redland R package's  `getNextResult` function. 
    Since this function (`getNextResult`) has been superceded by the more efficient `getResults` 
    function, we have decided to deprecate `getNextResult`. The WARNING message will therefor persist
    until this function is marked DEFUNCT and removed from the redland R package, which will happen in the next release.
    Note that the downstream dependant packages (datapack, rdflib) do not use `getNextResult`.
* There was the following 1 NOTE: 
  - A NOTE regarding "sub-directories of 1Mb or more" for the libs directory.
    For the Windows builds only, the "libs" directory contains only the redland.dll 
    files build for each Windows sub-architecture (i385, x64) and is necessary for 
    the redland package to run.

## Downstream dependencies

* The downstream dependencies (datapack, rdflib) have been checked with devtools::revdep_check(), which passed
  with 0 errors, 0 warnings, 0 notes.
