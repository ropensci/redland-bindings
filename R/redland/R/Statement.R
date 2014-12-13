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

#' An RDF Statement object
#' @slot librdf_statement A redland statement object
#' @author Peter Slaughter
#' @rdname Statement-class
#' @include redland.R
#' @include World.R
#' @include Node.R
#' @keywords classes
#' @exportClass Statement
#' @examples
#' \dontrun{
#' stmt <- new("Statement", world, subject, predicate, object)
#' }
setClass("Statement", slots = c(librdf_statement = "_p_librdf_statement_s"))

#' Construct a Statement object.
#' @param world a World object
#' @param subject a Node object
#' @param predicate a Node object
#' @param object a Node object
#' @return the Statement object
#' @export
setMethod("initialize", signature = "Statement", definition = function(.Object, world, subject, predicate, object) {
  # Ensure that all provided params are not null
  stopifnot(!is.null(world), !is.null(subject), !is.null(predicate), !is.null(object))
  
  # Create the underlying redland statement object
  .Object@librdf_statement <- librdf_new_statement_from_nodes(world@librdf_world, 
                                                              subject@librdf_node, 
                                                              predicate@librdf_node, 
                                                              object@librdf_node);            
  return(.Object)
})
