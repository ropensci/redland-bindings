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

#' A Redland Node, used to store one node in an RDF triple statement.
#' @description A Node represents a RDF Resource, Property, or Literal.
#' @details   
#' @slot node A redland node object
#' @author Matthew Jones
#' @include redland.R
#' @rdname Node-class
#' @keywords classes
#' @examples
#' \dontrun{
#' node <- new("Node")
#' }
setClass("Node", slots = c(librdf_node = "_p_librdf_node_s"))

setGeneric("Node", function(world, literal) {
  standardGeneric("Node")
})

#' Node Constructor.
#' @description 
#' @details
#' @param world a World object
#' @param literal a literal character value to be used as the vale of the node
#' @return the Node object
#' @export
setMethod("Node", signature("World", "character"), definition = function(world, literal=as.character(NA)) {
  .Object <- new("Node")
  if (!is.na(literal)) {
    .Object@librdf_node <- librdf_new_node(world@librdf_world)
  } else {
    .Object@librdf_node <- librdf_new_node_from_literal(world@librdf_world, literal, "", 0)
  }
  return(.Object)
})
