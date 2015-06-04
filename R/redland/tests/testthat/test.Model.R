context("Model tests")
test_that("redland library loads", {
  library(redland)
})
test_that("Model constructor", {
  library(redland)
  world <- new("World")
  expect_that(world, not(is_null()))
  
  # Test creating the Storage system
  storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
  expect_that(storage, not(is_null()))
  expect_that(class(storage@librdf_storage), matches("_p_librdf_storage_s"))
  
  # Test creating the Model
  model <- new("Model", world, storage, options="")
  expect_that(model, not(is_null()))
  expect_that(class(model@librdf_model), matches("_p_librdf_model_s"))
  
  # Test that model creation fails if world is not provided or is null
  err <- try(model <- new("Model", world=NULL, storage, options=""), silent=TRUE)
  expect_that(class(err), matches("try-error"))
  
  # Test that model creation fails if storage is not provided or is null
  err <- try(model <- new("Model", world, storage=NULL, options=""), silent=TRUE)
  expect_that(class(err), matches("try-error"))
  
  # Test adding a Statement to the Model
  subject <- new("Node", world, uri="http://www.dajobe.org")
  expect_that(class(subject@librdf_node), matches("_p_librdf_node_s"))
  predicate <- new("Node", world, uri="http://purl.org/dc/elements/1.1/creator")
  expect_that(class(predicate@librdf_node), matches("_p_librdf_node_s"))
  object <- new("Node", world, literal="John Smith")
  expect_that(class(object@librdf_node), matches("_p_librdf_node_s"))
  
  statement <- new("Statement", world, subject, predicate, object)
  expect_that(statement, not(is_null()))
  expect_that(class(statement@librdf_statement), matches("_p_librdf_statement_s"))
  addStatement(model, statement)
  
  err <- try(freeStatement(statement), silent=TRUE)
  expect_that(class(err), not(matches("try-error")))
  err <- try(freeModel(model), silent=TRUE)
  expect_that(class(err), not(matches("try-error")))
  err <- try(freeStorage(storage), silent=TRUE)
  expect_that(class(err), not(matches("try-error")))
  err <- try(freeWorld(world), silent=TRUE)
  expect_that(class(err), not(matches("try-error")))
})