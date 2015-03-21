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

#' QueryResult is used to retrieve query results from a Query object.
#' @slot librdf_query_results A redland query object
#' @author Peter Slaughter
#' @rdname QueryResults-class
#' @include redland.R
#' @keywords classes
#' @exportClass QueryResults
#' @examples
#' \dontrun{
#' query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
#' queryResult <- executeQuery(query, results)
#' }
setClass("QueryResults", slots = c(librdf_query_results = "_p_librdf_query_results"))

#' Initialize the QueryResults object.
#' @description The QueryResults object is initialized with the librdf query result from
#' return value of \code{'Query.execute()'}.
#' @details A QueryResults object is returned by the \code{Query.executeQuery()} method, so typically a user
#' does not initialize a QueryResult object by calling \code{new("QueryResult", ...)}
#' @param .Object the QueryResults object.
#' @param results a librdf query result
#' @return the QueryResults object
#' @export
setMethod("initialize", signature = "QueryResults", definition = function(.Object, results) {
  .Object@librdf_query_results <- results     
  return(.Object)
})

#' Get the next query result
#' @description The next query result is returned
#' @param .Object a QueryResults object
#' @export
setGeneric("getNextResult", function(.Object) {
  standardGeneric("getNextResult")
})

#' @param .Object a QueryResults object
#' @describeIn QueryResults
setMethod("getNextResult", signature("QueryResults"), function(.Object) {

  nodeNames <- list()
  nodeValues <- list()
  
  # Process the next result, storing the bound values in a list
  if (!is.null(.Object@librdf_query_results) && librdf_query_results_finished(.Object@librdf_query_results) == 0) {
    num_nodes <- librdf_query_results_get_bindings_count(.Object@librdf_query_results)
    for (i in 1:num_nodes-1) {
      binding_name <- librdf_query_results_get_binding_name(.Object@librdf_query_results, i)
      val = librdf_query_results_get_binding_value(.Object@librdf_query_results, i)
      # If no value returned for this binding, set to "NA"
      if (!is.null.externalptr(val@ref)) {
        nval <- librdf_node_to_string(val)
      } else {
        nval = as.character(NA)
      }
      nodeNames <- c(nodeNames, binding_name)
      nodeValues <- c(nodeValues, nval)
    }
  } else {
    return(NULL)
  }
  
  names(nodeValues) <- nodeNames
  nextResult <-librdf_query_results_next(.Object@librdf_query_results)
  
  return(nodeValues)
})

#' Free memory used by a librdf query results
#' @details After this method is called, the QueryResults object is no longer usable and should
#' be deleted with \code{"rm(query)"}.
#' @param .Object a QueryResults object
#' @export
setGeneric("freeQueryResults", function(.Object) {
  standardGeneric("freeQueryResults")
})

#' @describeIn QueryResults
setMethod("freeQueryResults", signature("QueryResults"), function(.Object) {
  # Have to free all of the nodes that were created by the query result that
  # hold the bound node values
  if (!is.null(.Object@librdf_query_results) && librdf_query_results_finished(.Object@librdf_query_results) == 0) {
    num_nodes <- librdf_query_results_get_bindings_count(.Object@librdf_query_results)
    for (i in 1:num_nodes-1) {
      binding_name <- librdf_query_results_get_binding_name(.Object@librdf_query_results, i)
      val = librdf_query_results_get_binding_value(.Object@librdf_query_results, i)    
      if (!is.null.externalptr(val@ref)) {
        librdf_free_node(val)
      } 
    }
  }
  
  librdf_free_query_results(.Object@librdf_query_results)
})
