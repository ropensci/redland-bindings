#' @export
mergeNamespace_roclet <- function() {
  #cat(sprintf("Called mergeNamespace_roclet.\n"))
  new_roclet(list, "mergeNamespace")
}

#' @export
roc_process.mergeNamespace <- function(roclet, partita, base_path, options = list()) {
  #cat(sprintf("Called roc_process.mergeNamespace\n"))
}

#' @export
roc_output.mergeNamespace <- function(roclet, results, base_path, options = list(), check) {
  
  #cat(sprintf("Called roc_output.mergeNamespace!\n"))
  #cat(sprintf("base_path: %s\n", base_path))
  
  filePathNS <- file.path(base_path, "NAMESPACE")
  filePathNSlibrdf <- file.path(base_path, "NAMESPACE.in")
  
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