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
#' @description
#' @details   
#' @slot world A redland world object
#' @author Matthew Jones
#' @include redland.R
#' @rdname World-class
#' @include redland.R
#' @keywords classes
#' @examples
#' \dontrun{
#' world <- new("World")
#' }
setClass("World", slots = c(world = "_p_librdf_world_s"))

#' Initialize the World object.
#' @description 
#' @details
#' @return the World object
#' @export
setMethod("initialize", signature = "World", definition = function(.Object) {
    .Object@world <- librdf_new_world();
    genv <- globalenv()
    assign("rdf_world", .Object, envir=genv)
    return(.Object)
})
