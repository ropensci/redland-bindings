context("librdf free memory tests")
test_that("redland library loads", {
  library(redland)
})
test_that("librdf_free_statement runs", {
  library(redland)
  world <- librdf_new_world();
  storage <- librdf_new_storage(world,'hashes','dummy',"new=yes,hash-type='memory'")
  model <- librdf_new_model(world,storage,'')
  
  subject <- librdf_new_node_from_uri_string(world, "http://www.joesmith.org")
  pred    <- librdf_new_node_from_uri_string(world, "http://purl.org/dc/elements/1.1/title")
  object  <- librdf_new_node_from_literal(world, "Joe Smith' Home Page", "", 0)
  
  statement <- librdf_new_statement_from_nodes(world, subject, pred, object)
  rc <- librdf_model_add_statement(model, statement)
  
  # Executing this test file causes a core dump when the line
  #
  #      'librdf_free_statement(statement)'
  #
  # line is executed. The error message produced is:
  #
  # *** Error in `/usr/lib/R/bin/exec/R': malloc(): smallbin double linked list corrupted: 0x0000000001228f30 ***
  #
  # The core dump occurs when both librdr_free_statement and librdf_free_node are called,
  # regardless of librdf_free_statement being called before or after librdr_free_node
  #
  # The 'librdf_free_node' lines are commented out so that the tests don't crash, but this test should
  # be run after Redland fixes this problem. This may be related to librdf_statement_clear
  # not being available for the R implementation.
  # Note that this abort doesn't always occur, but is most easily reproduced when tests are run right after
  # R has been started.
  #librdf_free_node(subject)
  #librdf_free_node(pred)
  #librdf_free_node(object)
  librdf_free_statement(statement)
  
  librdf_free_model(model);
  librdf_free_storage(storage);
  librdf_free_world(world);
})
