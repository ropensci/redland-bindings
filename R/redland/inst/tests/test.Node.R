context("Node tests")
test_that("redland library loads", {
    library(redland)
})
test_that("Node constructor", {
    library(redland)
    node <- new("Node");
    expect_that(class(node), matches("Node"))
    expect_that(exists("rdf_world", globalenv()), is_true())
    node <- new("Node", literal="Fee Fi Fo Fum")
    expect_that(class(node@node), matches("_p_librdf_node_s"))
    
})