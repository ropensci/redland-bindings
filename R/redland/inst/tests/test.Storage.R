context("Storage tests")
test_that("redland library loads", {
    library(redland)
})
test_that("Storage constructor", {
    library(redland)
    world <- new("World")
    expect_that(world, not(is_null()))
    
    # Test creating Subject, predicate, and object Nodes
    subject <- new("Node", world, literal="subject")
    expect_that(class(subject@librdf_node), matches("_p_librdf_node_s"))
    predicate <- new("Node", world, literal="subject")
    expect_that(class(predicate@librdf_node), matches("_p_librdf_node_s"))
    object <- new("Node", world, literal="subject")
    expect_that(class(object@librdf_node), matches("_p_librdf_node_s"))
    
    # Test creating the Storage system
    storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
    expect_that(storage, not(is_null()))
    expect_that(class(storage@librdf_storage), matches("_p_librdf_storage_s"))
    
    # Test that storage creation fails if world is not provided or is null
    err <- try(storage <- new("Storage", world=NULL, "hashes", name="", options="hash-type='memory'"), silent=TRUE)
    expect_that(class(err), matches("try-error"))
})