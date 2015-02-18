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

setClass('_p_librdf_query', contains = 'ExternalReference')

#' A Redland Query, used to initialize the Redland RDF library.
#' @slot query A redland query object
#' @author Scott Chamberlain
#' @rdname Query-class
#' @include redland.R
#' @keywords classes
#' @exportClass Query
#' @examples
#' \dontrun{
#' world <- new("World")
#' query <- new("Query", querystring="foo bar")
#' }
setClass("Query", slots = c(librdf_query = "_p_librdf_query"))

#' Initialize the Query object.
#' @return the Query object
#' @export
setMethod("initialize",
          signature = "Query",
          definition = function(.Object, world, querystring, base_uri=NULL, query_language="sparql", query_uri=NULL) {
#   .Object@librdf_world <- librdf_new_query();
#   librdf_world_open(.Object@librdf_world)
#   return(.Object)

  # self._query = None
  stopifnot(!is.null(querystring))

  # if not PY3 and isinstance(querystring, unicode):
  #    querystring = querystring.encode('utf-8')
  # Encoding(querystring) <- 'UTF-8' # not sure how to do this correctly, what is PY3?

  ruri <- if( !is.null(query_uri) ) query_uri$`_reduri` else NULL
  rbase_uri <- if( !is.null(base_uri) ) base_uri$`_reduri` else NULL

#   if _debug:
#     print("Creating query for language '"+query_language+"', base '"+unicode(rbase_uri)+"': "+querystring)

  .Object@librdf_query <- librdf_new_query(world@librdf_world, query_language, ruri, querystring, rbase_uri)
  .Object@result_stream <- NULL

  stopifnot(!is.null(.Object@query))

  return(.Object)
})


#' Free memory used by a librdf model.
#' @details After this method is called, the Model object is no longer usable and should
#' be deleted \code{"rm(query)"} and a new object created.
#' @param .Object a Model object
#' @export
setGeneric("freeQuery", function(.Object) {
  standardGeneric("freeQuery")
})

setMethod("freeQuery", signature("Query"), function(.Object) {
  librdf_free_query(.Object@librdf_query)
})
