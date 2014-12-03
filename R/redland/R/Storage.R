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
#' @description
#' @details   
#' @slot librdf_storage A redland storage object
#' @author Peter Slaughter
#' @rdname Storage-class
#' @include redland.R
#' @keywords classes
#' @examples
#' \dontrun{
#' storage <- Storage(world, "hashes", name="", options="hash-type='memory'")
#'
setClass("Storage", slots = c(librdf_storage = "_p_librdf_storage_s",
                              type = "character"
))

setGeneric("Storage", function(world, type, name, options) {
  standardGeneric("Storage")
})

#' Constructor for Storage object
#' @description
#' @details
#' @param world the World object
#' @param type the Redland storage type
#' @param name storage instance name
#' @param options storage options
#' @return the Storage object
#' @export
setMethod("Storage", signature("World", "character", "character", "character"), 
          definition = function(world, type, name, options) {
  .Object <- new("Storage")
  .Object@librdf_storage <- librdf_new_storage(world@librdf_world, type, name, options);
   #librdf_storage_open(.Object@librdf_storage)
            
  return(.Object)
})