
#' Determine whether an externalptr object is NULL.
#' 
#' The pointer is treated as an externalptr and checked via a call in C to see if it is NULL.
#' @param pointer externalptr to be checked for NULL value
#' @return logical TRUE if the pointer is NULL, otherwise FALSE
#' @export
is.null.externalptr <- function(pointer) {
    if (class(pointer)!="externalptr") stop("pointer is not an externalptr.")
    rv <- .Call("isnull", pointer)
    return(rv)
}
