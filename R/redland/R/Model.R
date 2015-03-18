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

#' An RDF Model object.
#' @slot librdf_model A redland model object
#' @author Peter Slaughter
#' @rdname Model-class
#' @include redland.R
#' @include World.R
#' @include Storage.R
#' @include Statement.R
#' @keywords classes
#' @exportClass Model
#' @examples
#' \dontrun{
#' model <- new("Model", world, storage, options)
#' addStatement(model, statement)
#' }
setClass("Model", slots=c(librdf_model = "_p_librdf_model_s"))

#' Constructor for a Model object.
#' @param .Object a Node object
#' @param world a World object
#' @param storage a Storage object
#' @param options extra options for model initialization
#' @return the World object
#' @export
setMethod("initialize", signature = "Model", definition = function(.Object, world, storage, options) {
    stopifnot(!is.null(world), !is.null(storage))
    .Object@librdf_model <- librdf_new_model(world@librdf_world, storage@librdf_storage, options);
    return(.Object)
})

#' Add a Statement object to the Model
#' @param .Object a Model object
#' @param statement the Statement that will be added
#' @export
setGeneric("addStatement", function(.Object, statement) {
  standardGeneric("addStatement")
})

#' @describeIn Model
#' @param .Object a Model object
#' @param statement the Statement that will be added
setMethod("addStatement", signature("Model", "Statement"), function(.Object, statement) {
  
  librdf_model_add_statement(.Object@librdf_model, statement@librdf_statement);
})

#' Free memory used by a librdf model.
#' @details After this method is called, the Model object is no longer usable and should
#' be deleted \code{"rm(model)"} and a new object created.
#' @param .Object a Model object
#' @export
setGeneric("freeModel", function(.Object) {
  standardGeneric("freeModel")
})

#' @describeIn Model
setMethod("freeModel", signature("Model"), function(.Object) {
  librdf_free_model(.Object@librdf_model)
})
