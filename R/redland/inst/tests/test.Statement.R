context("Statement tests")
test_that("redland library loads", {
  library(redland)
})
test_that("Statement constructor", {
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
  
  # Test creating the Statement
  stmt <- new("Statement", world, subject, predicate, object)
  expect_that(stmt, not(is_null()))
  expect_that(class(stmt@librdf_statement), matches("_p_librdf_statement_s"))
  
  # Test that statement creation fails if world is not provided or is null
  err <- try(stmt <- new("Statement", world=NULL, subject=subject, predicate=predicate, object=object), silent=TRUE)
  expect_that(class(err), matches("try-error"))
  
  # Test that statement creation fails if subject, predicate, or object is not provided or is null
  err <- try(stmt <- new("Statement", world=world, subject=NULL, predicate=predicate, object=object), silent=TRUE)
  expect_that(class(err), matches("try-error"))
  err <- try(stmt <- new("Statement", world=world, subject=subject, predicate=NULL, object=object), silent=TRUE)
  expect_that(class(err), matches("try-error"))
  err <- try(stmt <- new("Statement", world=world, subject=subject, predicate=predicate, object=NULL), silent=TRUE)
  expect_that(class(err), matches("try-error"))
})