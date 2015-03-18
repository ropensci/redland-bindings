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
#' An RDF Serializer object
#' @slot librdf_serializer A redland statement object
#' @author Peter Slaughter
#' @rdname Serializer-class
#' @include redland.R
#' @include World.R
#' @include Model.R
#' @keywords classes
#' @exportClass Serializer
#' @examples
#' \dontrun{
#' serializer <- new("Serializer", world, factoryName, mimeType, typeUri)
#' setNameSpace(serializer, world, namespace, prefix)
#' RDF <- serializeToCharacter(serializer, world, model, baseUri)
#' }
setClass("Serializer", slots = c(librdf_serializer = "_p_librdf_serializer_s"))

#' Construct a Serializer object.
#' @param .Object the Serializer object
#' @param world a World object
#' @param name name of a previously created serializer factory to use
#' @param mimeType a mime type of the syntax of the model
#' @param typeUri a URI for the syntax of the model
#' @return the Serializer object
#' @export
setMethod("initialize", signature = "Serializer", definition = function(.Object, world, name="rdfxml", mimeType="application/rdf+xml", typeUri=as.character(NA)) {
  # Ensure that all provided params are not null
  stopifnot(!is.null(world))
  
  if(is.na(typeUri)) {
    librdf_uri <- NULL
  } else {
    librdf_uri <- librdf_new_uri(world@librdf_world, typeUri)
  }
  
  # Create the underlying redland statement object
  .Object@librdf_serializer <- librdf_new_serializer(world@librdf_world, 
                                                     name,
                                                     mimeType,
                                                     librdf_uri);
  return(.Object)
})

#' Set a namespace for the serializer
#' @param .Object a Serializer object
#' @param world a World object
#' @param namespace the namespace to add to the serializer
#' @param prefix the namespace prefix to associate with the namespace
#' @export
setGeneric("setNameSpace", function(.Object, world, namespace, prefix) {
  standardGeneric("setNameSpace")
})

#' Set a namespace for the serializer
#' @param .Object a Serializer object
#' @param world a World object
#' @param namespace the namespace to add to the serializer
#' @param prefix the namespace prefix to associate with the namespace
setMethod("setNameSpace", signature("Serializer", "World", "character", "character"), function(.Object, world, namespace, prefix) {
  
  stopifnot(!is.null(world))
  
  librdf_uri <- librdf_new_uri(world@librdf_world, namespace)
  librdf_serializer_set_namespace(.Object@librdf_serializer, librdf_uri, prefix)
})

#' Serialize a model to a character vector
#' @param .Object a Serializer object
#' @param world a World object
#' @param model a Model object
#' @param ... baseUri a URI to prepend to relative URIs in the document
#' @return a character vector containing the serialized model
#' @export
setGeneric("serializeToCharacter", function(.Object, world, model, ...) {
  standardGeneric("serializeToCharacter")
})

#' Serialize a model to a character vector
#' @param .Object a Serializer object
#' @param world a World object
#' @param model a Model object
#' @param baseUri a URI to prepend to relative URIs in the document
## @describeIn Serializer
setMethod("serializeToCharacter", signature("Serializer", "World", "Model"), function(.Object, world, model, baseUri=as.character(NA)) {
  
  stopifnot(!is.null(world))
  stopifnot(!is.null(model))
  
  # Convert baseUri to a librdf_uri
  if(is.na(baseUri)) {
    librdf_uri <- NULL
  } else {
    librdf_uri <- librdf_new_uri(world@librdf_world, baseUri)
  }
  
  RDFstring <- librdf_serializer_serialize_model_to_string(.Object@librdf_serializer, librdf_uri, model@librdf_model)
  return(RDFstring)
})

#' Serialize a model to a file
#' @param .Object a Serializer object
#' @param world a World object
#' @param model a Model object
#' @param filePath a file path that the serialized model will be written to
#' @param ... baseUri a base URI to use for the serialization
#' @return an integer containing the return status where non zero indicates an error occured during serialization
#' @export
setGeneric("serializeToFile", function(.Object, world, model, filePath, ...) {
  standardGeneric("serializeToFile")
})

#' Serialize a model to a file
#' @param .Object a Serializer object
#' @param world a World object
#' @param model a Model object
#' @param filePath a file path that the serialized model will be written to
#' @param baseUri a base URI to use for the serialization
setMethod("serializeToFile", signature("Serializer", "World", "Model", "character"), function(.Object, world, model, filePath, baseUri=as.character(NA)) {
  
  stopifnot(!is.null(world))
  stopifnot(!is.null(model))
  stopifnot(!is.null(filePath))
  
  # Convert baseUri to a librdf_uri
  if(is.na(baseUri)) {
    librdf_uri <- NULL
  } else {
    librdf_uri <- librdf_new_uri(world@librdf_world, baseUri)
  }
  
  status <-librdf_serializer_serialize_model_to_file (.Object@librdf_serializer, filePath, librdf_uri, model@librdf_model);
  return(status)
})

#' Free memory used by a librdf serializer
#' @param .Object a Serializer object
#' @export
setGeneric("freeSerializer", function(.Object) {
  standardGeneric("freeSerializer")
})

#'  Free memory used by a librdf serializer
#' @param .Object a Serializer object
setMethod("freeSerializer", signature("Serializer"), function(.Object) {
  librdf_free_serializer(.Object@librdf_serializer)
})
