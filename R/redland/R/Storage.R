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

#' A Redland Storage object
#' @slot librdf_storage A redland storage object
#' @slot type the storage type to create, i.e. "hashes", "mysql", "postgresql", ...
#' @author Peter Slaughter
#' @rdname Storage-class
#' @include redland.R
#' @include World.R
#' @keywords classes
#' @exportClass Storage
#' @examples
#' \dontrun{
#' storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
#'}
setClass("Storage", slots = c(librdf_storage = "_p_librdf_storage_s",
                              type = "character"
))

#' Constructor for Storage object
#' @param .Object the Storage object
#' @param world the World object
#' @param type the Redland storage type
#' @param name storage instance name
#' @param options storage options
#' @return the Storage object
#' @export
setMethod("initialize", signature = "Storage", definition = function(.Object, world, type="hashes", name="", options="hash-type='memory'") {
    stopifnot(!is.null(world))
    .Object@type <- type
    .Object@librdf_storage <- librdf_new_storage(world@librdf_world, type, name, options);
    #librdf_storage_open(.Object@librdf_storage)
            
  return(.Object)
})

#' Free memory used by a librdf storage object
#' @details After this method is called, the Storage object is no longer usable and should
#' be deleted \code{"rm(storage)"} and a new object created.
#' @param .Object a Storage object to free memory for
#' @export
setGeneric("freeStorage", function(.Object) {
  standardGeneric("freeStorage")
})

#' @describeIn Storage
#' @param .Object a Storage object
setMethod("freeStorage", signature("Storage"), function(.Object) {
  librdf_free_storage(.Object@librdf_storage)
})