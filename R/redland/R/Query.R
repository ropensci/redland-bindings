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

#' Query an RDF model
#' @description The Query class is used to execuate a query on a Model object using the default query
#' language SPARQL. For more information, please refer to \url{http://librdf.org/rasqal/} for details on 
#' supported query languages.
#' @details A Query is executed using the executeQuery method, which returns a QueryResults object that
#' can be interated over the query solution sequence.
#' @slot librdf_query A redland query object
#' @author Scott Chamberlain, Peter Slaughter
#' @rdname Query-class
#' @include redland.R
#' @keywords classes
#' @exportClass Query
#' @references www.example.com
#' @examples
#' \dontrun{
#' queryString <- 'PREFIX prov: <http://www.w3.org/ns/prov#> SELECT ?a ?c WHERE { ?a prov:Agent ?c . }'
#' query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
#' }
setClass("Query", slots = c(librdf_query = "_p_librdf_query"))

#' Initialize the Query object.
#' @param .Object the Query object
#' @param world a World object
#' @param querystring a query string for the language specified in 'query_language'
#' @param base_uri a URI to prepend to relative URI in the document
#' @param query_language the query language to execute the querystring with
#' @param query_uri a URI to prepend to terms in the query
#' @return the Query object
#' @export
setMethod("initialize",
          signature = "Query",
          definition = function(.Object, world, querystring, base_uri=NULL, query_language="sparql", query_uri=NULL) {

  stopifnot(!is.null(querystring))
  .Object@librdf_query <- librdf_new_query(world@librdf_world, query_language, base_uri, querystring, query_uri)

  return(.Object)
})

#' Execute a query
#' @description The initialize query is executed and the result is returned as a QueryResult object
#' @param .Object a Query object
#' @param model a Model object
#' @return a QueryResults object
#' @export
setGeneric("executeQuery", function(.Object, model) {
  standardGeneric("executeQuery")
})

#' @param .Object a Query object
#' @param model a Model object
#' @describeIn Query
setMethod("executeQuery", signature("Query"), function(.Object, model) {
  results <- librdf_query_execute(.Object@librdf_query, model@librdf_model) 
  queryResultObj <- new("QueryResults", results)
  return(queryResultObj)
})

#' Set limit on returned query results
#' @param .Object a Query object
#' @param limit the result set limit. Specify a value >= to have a limit, or a value < 0 to have no limit.
#' @export
setGeneric("setQueryResultLimit", function(.Object, limit) {
  standardGeneric("setQueryResultLimit")
})

#' @param limit max number of results to return
#' @describeIn Query
setMethod("setQueryResultLimit", signature("Query"), function(.Object, limit) {
  librdf_query_set_limit(.Object@librdf_query, as.integer(limit))
})

#' Get the query result limit
#' @param .Object a Query object
#' @return the query result limit. If a limit is set then the value will be >= 0. If the value is < 0, no limit is set
#' @export
setGeneric("getQueryResultLimit", function(.Object) {
  standardGeneric("getQueryResultLimit")
})

#' @describeIn Query
setMethod("getQueryResultLimit", signature("Query"), function(.Object) {
  return(librdf_query_get_limit (.Object@librdf_query))
})

#' Free memory used by a librdf query
#' @details After this method is called, the Query object is no longer usable and should
#' be deleted \code{"rm(query)"} and a new object created.
#' @param .Object a Query object
#' @export
setGeneric("freeQuery", function(.Object) {
  standardGeneric("freeQuery")
})

#' @describeIn Query
setMethod("freeQuery", signature("Query"), function(.Object) {
  librdf_free_query(.Object@librdf_query)
})
