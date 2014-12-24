#
#   This work was created by the National Center for Ecological Analysis and Synthesis.
#
#     Copyright 2014
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#' A custom Roxygen roclet that merges a base NAMESPACE file with the Roxygen NAMESPACE file
#' @description The redland package uses the SWIG (Simplified Wrapper and Interface Generator) to
#' create the bindings between the Redland RDF C/C++ libraries and R. SWIG creates a NAMESPACE
#' file that contains the function names for the librdf wrapper that it creates, but as of
#' swig 3.0.2 this NAMESPACE file is incorrect and will also be overwritten by Roxygen when
#' 'roxygenize()' or 'devtools:document()' is called, as the wrapper R code doesn't contain
#' Roxygen export annotations used by Roxygen to build the namespace file.
#' To allow for buidling a NAMESPACE file from all programs in the redland package, this roclet
#' uses a manually created file 'NAMESPACE.librdf' that contains all wrapper R functions. This
#' file is merges with a dynamically created NAMESPACE file that contains all names from the 
#' native R code in the redland package.
#' @details The following line must be present in the DESCRIPTION file for this roclet to be
#' called automatically when 'roxygen2::roxygenize()' or 'devtools::document()' is called:
#' 
#' Roxygen: list(roclets = c("collate", "rd", "namespace", "mergeNamespace"))
#' 
#' The 'namespace' roclet must always run before the 'mergeNamespace' roclet.
#' Note that the NAMESPACE.librdf file will have to be modified in the event of API changes to the
#' Redland RDF library, such as new functions being added to the R implementation.
#' @author Peter Slaughter
#' @examples
#' \dontrun{
#' roxygen2::roxygenize()
#' devtools::document()
#' }
#' @export
mergeNamespace_roclet <- function() {
  #cat(sprintf("Called mergeNamespace_roclet.\n"))
  new_roclet(list, "mergeNamespace")
}

#' Roxygen process function for the 'mergeNamespace' roclet
#' @description This function is called by the Roxygen2 roxygenize function.
#' @details The 'mergeNamespace' roclet doesn't utilize this function, but it still must
#' be defined in order for the roclet to run properly.
#' @param roclet the currently running roclet
#' @param partita a list of all .R files in the package being roxygenized
#' @param base_path the top directory of the R package
#' @param options unused by this roclet
#' @export
roc_process.mergeNamespace <- function(roclet, partita, base_path, options = list()) {
}

#' Roxygen output function that merges a base NAMESPACE file with the Roxygen dynamically created NAMSPACE file
#' @description The 'roclet_output' function handles output of the results from the 'roc_process' fun tion.
#' For the 'mergeNamespace' roclet, 'roc_process' is a stub funtion. This 'roc_output' function merges
#' the file 'NAMESPACE.librdf' with the dynamically created 'NAMESPACE' file.
#' @param roclet the currently running roclet
#' 
#' @export
roc_output.mergeNamespace <- function(roclet, results, base_path, options = list(), check) {
  
  filePathNS <- file.path(base_path, "NAMESPACE")
  filePathNSlibrdf <- file.path(base_path, "inst/build/NAMESPACE.swig")
  
  NScontents <- if (file.exists(filePathNS)) readLines(filePathNS) else ""
  NSlibrdfContents <- if (file.exists(filePathNSlibrdf)) readLines(filePathNSlibrdf) else ""
  
  # Remove leading and trailing white space
  trim <- function (x) gsub("^\\s+|\\s+$", "", x)
  NScontents < unlist(lapply(NScontents, function(x) trim(x)))
  NSlibrdfContents < unlist(lapply(NSlibrdfContents, function(x) trim(x)))
  
  mergedContents <- NScontents
  for (tm in NSlibrdfContents) {
    # if (! tm %in% NScontents) {
    mergedContents <- c(mergedContents, tm)
  }
  
  if (!identical(mergedContents, NScontents)) {
    cat("Updating namespace directives\n")
    writeLines(mergedContents, filePathNS)
  }
  
  filePathNSlibrdf
}
