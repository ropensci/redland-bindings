context("Node tests")
test_that("redland library loads", {
    library(redland)
})
test_that("Node constructor", {
    library(redland)
    world <- new("World")
    expect_that(world, not(is_null()))
    
    # Test creating a blank node
    node <- new("Node", world);
    expect_that(node, not(is_null()))
    expect_that(class(node), matches("Node"))
    
    # Test creating a node with a literal value
    node <- new("Node", world, literal="Fee Fi Fo Fum")
    expect_that(class(node@librdf_node), matches("_p_librdf_node_s"))    
    
    # Test that node creation fails if world is not provided or is null
    err <- try(node <- new("Node", literal="Fee Fi Fo Fum"), silent=TRUE)
    expect_that(class(err), matches("try-error"))
    err <- try(node <- new("Node", world=NULL, literal="Fee Fi Fo Fum"), silent=TRUE)
    expect_that(class(err), matches("try-error"))
})