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

#' A Redland World, used to initialize the Redland RDF library.
#' @slot librdf_world A redland world object
#' @author Matthew Jones
#' @rdname World-class
#' @include redland.R
#' @keywords classes
## @useDynLib librdf
## @useDynLib libraptor2
## @useDynLib librasqal
#' @useDynLib redland
#' @exportClass World
#' @examples
#' \dontrun{
#' world <- new("World")
#' }
#' @import methods
#' @export
setClass("World", slots = c(librdf_world = "_p_librdf_world_s"))

#' Initialize the World object.
#' @param .Object the World object
#' @return the World object
#' @export
setMethod("initialize", signature = "World", definition = function(.Object) {
    .Object@librdf_world <- librdf_new_world();
    librdf_world_open(.Object@librdf_world)
    return(.Object)
})

#' Free memory used by a librdf world object
#' @details After this method is called, the World object is no longer usable and should
#' be deleted \code{"rm(world)"} and a new object created.
#' @param .Object a World object
#' @export
setGeneric("freeWorld", function(.Object) {
  standardGeneric("freeWorld")
})

#' @describeIn World
#' @param .Object a World object
setMethod("freeWorld", signature("World"), function(.Object) {
  librdf_free_world(.Object@librdf_world)
})
