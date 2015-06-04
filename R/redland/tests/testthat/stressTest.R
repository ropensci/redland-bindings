context("redland stress test")
# This test performs many iterations of building and deleting a redland RDF model
# This test is not intended to be run as part of the standard package tests, and so does
# not have a filename that will cause 'testthat' to automatically run it, so this test has
# to be run explicitly by sourcing the file  (source ./inst/tests/stressTest.R) or
# using testthat::test_file("./inst/tests/stessTest.R)
test_that("redland library loads", {
  library(redland)
})
test_that("redland builds and frees resources over many iterations", {
  library(redland)
  library(uuid)
  library(pryr)
  
  # Number of iterations to run
  nIterations <- 100
  # Number of statements to create for each run
  nStatements <- 500
  
  cat(sprintf("\nRunning %d iterations of creating a model with %d statements.\n", nIterations, nStatements))
  cat(sprintf("Memory in use before test: %s MB\n", pryr::mem_used()/1000000.0))
    
  for (i in 1:nIterations) {

    world <- new("World")
    #expect_that(world, not(is_null()))
    
    # Test creating the Storage system
    storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
    #expect_that(storage, not(is_null()))
    #expect_that(class(storage@librdf_storage), matches("_p_librdf_storage_s"))
    
    # Test creating the Model
    model <- new("Model", world, storage, options="")
    #expect_that(model, not(is_null()))
    #expect_that(class(model@librdf_model), matches("_p_librdf_model_s"))
    
    # Test that model creation fails if world is not provided or is null
    err <- try(model <- new("Model", world=NULL, storage, options=""), silent=TRUE)
    #expect_that(class(err), matches("try-error"))
    
    #expect_that(model, not(is_null()))
    #expect_that(class(model@librdf_model), matches("_p_librdf_model_s"))
    
    # Add many statements to the model
    for (j in 1:nStatements) {
      # Test adding a Statement to the Model
      uuid <- UUIDgenerate()
      subject <- new("Node", world, uri=sprintf("http://www.johnsmith.com/john-%s", uuid))
      #expect_that(class(subject@librdf_node), matches("_p_librdf_node_s"))
      
      predicate <- new("Node", world, uri="http://purl.org/dc/elements/1.1/creator")
      #expect_that(class(predicate@librdf_node), matches("_p_librdf_node_s"))
      
      object <- new("Node", world, literal=sprintf("John Smith-", uuid))
      #expect_that(class(object@librdf_node), matches("_p_librdf_node_s"))
      
      statement <- new("Statement", world, subject, predicate, object)
      #expect_that(statement, not(is_null()))
      #expect_that(class(statement@librdf_statement), matches("_p_librdf_statement_s"))
      addStatement(model, statement)
    }
    
    # Create a query
    queryString <- 'PREFIX dc: <http://purl.org/dc/elements/1.1/> SELECT ?a ?c WHERE { ?a dc:creator ?c . }'
    query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
    expect_that(class(query), matches("Query"))
    queryResult <- executeQuery(query, model)
    expect_that(class(queryResult), matches("QueryResult"))
    
    # Retrieve query results and check the actual result count against the expected count
    result <- getNextResult(queryResult)
    i <- 0
    while(! is.null(result)) {
      #print(result)
      i <- i + 1
      # Something went wrong, break loop
      if(i > nStatements) {
        break
      }
      result <- getNextResult(queryResult)
    }
    expect_that(i, equals(nStatements))
    
    # Test creating a Serializer
    serializer <- new("Serializer", world, mimeType="application/rdf+xml")
    #expect_that(serializer, not(is_null()))
    #expect_that(class(serializer@librdf_serializer), matches("_p_librdf_serializer_s"))
    
    # Test adding a namespace to a serializer
    status <- setNameSpace(serializer, world, namespace="http://purl.org/dc/elements/1.1/", prefix="dc")
    #expect_that(status, equals(0))
    
    # Test serialization of an RDF model to a string
    rdf <- serializeToCharacter(serializer, world, model, "")
    #expect_that(rdf, matches("John Smith"))
    rm(rdf)
    
    # Test serialization of an RDF model to a file
    filePath <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".rdf")
    status <- serializeToFile(serializer, world, model, filePath)
    found <- grep("John Smith", readLines(filePath))
    #expect_that(found, is_more_than(0))
    #cat(sprintf("filpath: %s\n", filePath))
    unlink(filePath)
    
    freeQuery(query)
    rm(query)
    
    freeQueryResults(queryResult)
    rm(queryResult)
    
    freeStatement(statement)
    rm(statement)
    
    freeModel(model)
    rm(model)
    
    freeSerializer(serializer)
    rm(serializer)
    
    freeStorage(storage)
    rm(storage)
    
    freeWorld(world)
    rm(world)
    cat(sprintf("."))
  }
  cat(sprintf("\nMemory in use after test:  %s MB\n", pryr::mem_used()/1000000.0))
  cat(sprintf("redland stess test completed\n"))
  
})