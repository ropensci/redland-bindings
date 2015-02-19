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
#' @param subject value of type \code{"Node"} or \code{"character"}, the value for the RDF subject
#' @param predicate value of type \code{"Node"} or \code{"character"}, the value for the RDF predicate
#' @param object value of type \code{"Node"} or \code{"character"}, the value for the RDF object
#' @param subjectType value of type \code{"character"}, the RDF term type to assign to the subject
#' @param objectType value of type \code{"character"}, the RDF term type to assign to the object
#' @exportClass Statement
#' @description A Statement object is created using the provided subject, predicate and object.
#' @details A Statement object can be created from Node objects that are provided for the subject,
#' predicate and object. An alternative way to create a Statement object is to provide the
#' subject, predicate and object as character values. If this later method is used, the character values will be evaluated to
#' determine the appropriate RDF type for the subject and object. Note that the RDF type for the predicate will always
#' be 'uri' (aka 'resource'). If the automatic determination of RDF types is not desired, then the \code{subjectType} and
#' \code{objectType} parameters can be specified to explicitly set the RDF types.
#'
#' @examples
#' \dontrun{
#' subject <- new("Node", blank="_:myid1")
#' predicate <- new("Node", uri="http://www.example.com/isa")
#' object <- new("Node", literal="thing")
#' stmt <- new("Statement", world, subject, predicate, object)
#' stmt <- new("Statement", world, subject="http://www.example.com/myevent",
#'                                 predicate="http://example.com/occurredAt",
#'                                 object="Tue Feb 17 14:05:13 PST 2015")
#' stmt <- new("Statement", world, subject=NULL, 
#'                                 predicate="http://www.example.com/hasAddr",
#'                                 object="http://www.nothing.com", objectType="literal")
#' }
setClass("Statement", slots = c(librdf_statement = "_p_librdf_statement_s"))

#' Construct a Statement object.
#' @param world a World object
#' @param subject a Node object
#' @param predicate a Node object
#' @param object a Node object
#' @return the Statement object
#' @export
setMethod("initialize", signature = "Statement", definition = function(.Object, world, subject, predicate, object, 
                                                                       subjectType=as.character(NA), 
                                                                       objectType=as.character(NA)) {
  # Ensure that all provided params are not null
  stopifnot(!is.null(world), !missing(subject), !missing(predicate), !missing(object))
  
  if ( (is.null(subject) || class(subject) == "character") &&
         class(predicate) == "character" && 
         (is.null(object) || class(object) == "character") ) {
    # If subjectType was not specified, determine the subjectType by inspecting the
    # subject value
    if (is.na(subjectType)) {
      if (is.null(subject)) {
        subjectType <- "blank"
      } else if (length(grep("^_:", subject)) == 1) {
        subjectType <- "blank"
      } else if (subject == "") {
        subjectType <- "blank"
      } else {
        subjectType <- "uri"
      }
    } else if (subjectType != "uri" && subjectType != "blank") {
      stop(sprintf("Invalid value for subjectType: %s", subjectType))
    }
        
    if (is.null(subject)) {
      subjectNode <- new("Node", world)
    } else if (subjectType == "blank") {
      subjectNode <- new("Node", world, blank=subject)
    } else if (subjectType == "uri") {
      subjectNode <- new("Node", world, uri=subject)
    } else {
      stop(sprintf("Invalid type for subject node: %s", subject))
    }
    
    predicateNode <- new("Node", world, uri=predicate)
    
    if (is.na(objectType)) {
      if (is.null(object)) {
        objectType <- "blank"
      } else if (length(grep("^http:", object)) == 1) {
        objectType <- "uri"
      } else if (length(grep("^https:", object)) == 1) {
        objectType <- "uri"
      } else if (length(grep("^urn:", object)) == 1) {
        objectType <- "uri"
      } else if (length(grep("^_:", object)) == 1) {
        objectType <- "blank"
      } else if (object == "") {
        objectType <- "blank"
      } else if (is.null(object)) {
        objectType <- "blank"
      } else {
        objectType <- "literal"
      }
    } else if (objectType != "uri" && objectType != "literal" && objectType != "blank") {
      stop(sprintf("Invalid value for objectType: %s", objectType))
    }
    
    if (is.null(object)) {
      objectNode <- new("Node", world)
    } else if (objectType == "blank") {
      objectNode <- new("Node", world, blank=object)
    } else if (objectType == "uri") {
      objectNode <- new("Node", world, uri=object)
    } else {
      objectNode <- new("Node", world, literal=object)
    }
    
    .Object@librdf_statement <- librdf_new_statement_from_nodes(world@librdf_world, 
                                                                subjectNode@librdf_node, 
                                                                predicateNode@librdf_node, 
                                                                objectNode@librdf_node);
  } else {
    if (class(subject) == "Node" && class(predicate) == "Node" && class(object) == "Node") {
      # Create the underlying redland statement object
      .Object@librdf_statement <- librdf_new_statement_from_nodes(world@librdf_world, 
                                                                  subject@librdf_node, 
                                                                  predicate@librdf_node, 
                                                                  object@librdf_node);
    } else {
      stop(sprintf("Invalid argument types for subject (%s), predicate(%s) or object(%s).", 
                   class(subject), class(predicate), class(object)))
    }
  }
  
  return(.Object)
})

#' Return the redland node type for the specified RDF term in a statement
#' @description After a Statement object has been created, this method can
#' be used to determine the RDF type ("uri", "literal", "blank") that has been
#' assigned to the specified RDF term, i.e. "subject", "predicate", "object".
#' @param term the RDF term for which the type will be returned
#' @export
setGeneric("getTermType", function(.Object, term) {
  standardGeneric("getTermType")
})

setMethod("getTermType", signature("Statement", "character"), function(.Object, term) {
  if (term != "subject" && term != "predicate" && term != "object") {
    stop("Must specify \"subject\", \"predicate\", or \"object\" for term")
  }
  
  # Retrieve a pointer to the specified node object from librdf
  if (term == "subject") {
    termPtr <- librdf_statement_get_subject(.Object@librdf_statement)
  } else if (term == "predicate") {
    termPtr <- librdf_statement_get_predicate(.Object@librdf_statement)
  } else {
    termPtr <- librdf_statement_get_object(.Object@librdf_statement)
  }

  # Print out the redland node type corresponding to the RDF term type for the specified term
  if(librdf_node_is_resource(termPtr)) {
    return("resource")
  } else if (librdf_node_is_literal(termPtr)) {
    return("literal")
  } else if (librdf_node_is_blank(termPtr)) {
    return("blank")
  } else {
    return("unknown")
  }
})


#' Free memory used by a librdf statement
#' @details After this method is called, the Statement object is no longer usable and should
#' be deleted  \code{"rm(statement)"} and a new object created.
#' @param .Object a Statement object
#' @export
setGeneric("freeStatement", function(.Object) {
  standardGeneric("freeStatement")
})
setMethod("freeStatement", signature("Statement"), function(.Object) {
  librdf_free_statement(.Object@librdf_statement)
  
})