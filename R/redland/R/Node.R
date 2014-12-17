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
#' @description A Node represents a RDF Resource, Property, Literal or an RDF blank Node.
#' @slot librdf_node A redland node object
#' @author Matthew Jones
#' @include redland.R
#' @include World.R
#' @rdname Node-class
#' @keywords classes
#' @exportClass Node
#' @examples
#' \dontrun{
#' node <- new("Node", world)     # a blank node is created
#' node <- new("Node", world, "A Node Value")     # a Node type of 'literal' is created
#' node <- new("Node", world, literal="A Node Value")     # a node type of 'literal' is created
#' node <- new("Node", world, uri="http://www.example.com")   # a Node type of 'resource' is created
#' }
setClass("Node", slots = c(librdf_node = "_p_librdf_node_s"))

#' Initialize a Node object.
#' @description A Node has an associated type corresponding to the RDF component that it is representing. The list of possible
#' types is "resource", "literal" or "blank".
#' @details The url=' and 'literal=' arguments determine which type of Node is created. The Node type affects how the Node is processed
#' in serialization, for example a Node created with 'node1 <- new("Node", literal="http://www.example.com")' is processed
#' differently that a Node created with 'node1 <- new("Node", url="http://www.example.com")', with the former being processed
#' as an RDF literal and the latter processed as an RDF resource.
#' @param .Object the Node object to be initialized
#' @param world a World object
#' @param literal a literal character value to be used as the vale of the node
#' @param uri a uri character value to be used as the value of the node
#' @return the Node object
#' @export
setMethod("initialize", signature = "Node", definition = function(.Object, world, literal, uri) {
  stopifnot(!is.null(world))
  
  # Neither 'literal' nor 'uri' specified, so create a blank node
  if(missing(literal) && missing(uri)) {
    .Object@librdf_node <- librdf_new_node(world@librdf_world)
  } else if (!xor(missing(literal), missing(uri))) {
    # If not creating blank node, must specify either 'literal' or 'uri' argument, not both
    stop("Please specify either 'literal=\"value\"' or 'uri=\"value\"'")
  } else if (!missing(literal)) {
    # Only 'literal=' was specified
    .Object@librdf_node <- librdf_new_node_from_literal(world@librdf_world, literal, "", 0)
  } else {
    # Only 'uri=' was specified
    librdf_uri <- librdf_new_uri(world@librdf_world, uri)
    .Object@librdf_node <- librdf_new_node_from_uri(world@librdf_world, librdf_uri)
  }
  return(.Object)
})

#' Determine the node type and return as a string
#' @description A Node has a type that is assigned at initialization and can have one of the following values:
#' 'resource', 'literal', 'blank' and 'unknown'.
#' @param .Object a Node object
#' @param URIbase a base URI to use for the serialization
#' @return a character vector containing the Node type
#' @export
setGeneric("getNodeType", function(.Object) {
  standardGeneric("getNodeType")
})

setMethod("getNodeType", signature("Node"), function(.Object) {
  
  if(librdf_node_is_resource(.Object@librdf_node)) {
    return("resource")
  } else if (librdf_node_is_literal(.Object@librdf_node)) {
    return("literal")
  } else if (librdf_node_is_blank(.Object@librdf_node)) {
    return("blank")
  } else {
    return("unknown")
  }
})
