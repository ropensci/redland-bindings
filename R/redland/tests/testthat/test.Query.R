context("Query tests")
test_that("redland library loads", {
  library(redland)
  # Add a line to this test to prevent 'Empty test' (skipped) msg.
  expect_true(require(redland))
})
test_that("Query works", {
  library(redland)
  world <- new("World")
  expect_false(is.null(world))
  
  # Test creating the Storage system
  storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
  expect_false(is.null(storage))
  expect_match(class(storage@librdf_storage), "_p_librdf_storage_s")
  
  # Test creating the Model
  model <- new("Model", world, storage, options="")
  expect_false(is.null(model))
  expect_match(class(model@librdf_model), "_p_librdf_model_s")
  
  # Test that model creation fails if world is not provided or is null
  err <- try(model <- new("Model", world=NULL, storage, options=""), silent=TRUE)
  expect_match(class(err), "try-error")
  
  expect_false(is.null(model))
  expect_match(class(model@librdf_model), "_p_librdf_model_s")
  
  # Add typical statements to the model
  stmt <- new("Statement", world=world, 
              subject="https://cn.dataone.org/cn/v1/resolve/urn:uuid:1ef9ff61-c4d6-4314-9ffd-cb8b8fd71e5c",
              predicate="http://www.w3.org/ns/prov#wasGeneratedBy",
              object="https://cn.dataone.org/cn/v1/resolve/urn:uuid:10153c9c-0cf4-4d92-9544-8e14089df8d0")
  addStatement(model, stmt)
  
  stmt <- new("Statement", world=world,
              subject="https://cn.dataone.org/cn/v1/resolve/urn:uuid:1ef9ff61-c4d6-4314-9ffd-cb8b8fd71e5c",
              predicate="http://purl.org/dc/terms/identifier",
              object="urn:uuid:1ef9ff61-c4d6-4314-9ffd-cb8b8fd71e5c", objectType="literal", datatype_uri="http://www.w3.org/2001/XMLSchema#string")
  addStatement(model, stmt)
  
  stmt <- new("Statement", world=world, 
              subject="https://cn.dataone.org/cn/v1/resolve/urn:uuid:274a0c5c-3082-4562-bbd3-2b1288768cac",
              predicate="http://www.w3.org/ns/prov#hadPlan",
              object="https://cn.dataone.org/cn/v1/resolve/urn:uuid:01305f45-f22b-40c8-8d27-00357d01e4a5")
  addStatement(model, stmt)

  stmt <- new("Statement", world=world, 
              subject="https://orcid.org/0000-0002-2192-403X",
              predicate="http://www.w3.org/ns/prov#Agent",
              object="slaughter", 
              objectType="literal", datatype_uri="http://www.w3.org/2001/XMLSchema#string")
  addStatement(model, stmt)
  
  stmt <- new("Statement", world=world,
              subject="https://cn.dataone.org/cn/v1/resolve/urn:uuid:1ef9ff61-c4d6-4314-9ffd-cb8b8fd71e5c",
              predicate="http://www.w3.org/ns/prov#qualifiedAssociation",
              object="https://cn.dataone.org/cn/v1/resolve/urn:uuid:274a0c5c-3082-4562-bbd3-2b1288768cac")
  addStatement(model, stmt)

# Query the RDF model with a SPARQL query that should return all triples
queryString <- 'PREFIX orcid: <https://orcid.org/> PREFIX dataone: <https://cn.dataone.org/cn/v1/resolve/> PREFIX prov: <http://www.w3.org/ns/prov#> SELECT ?a ?b ?c WHERE { ?a ?b ?c . }'
query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
expect_match(class(query), "Query")
queryResult <- executeQuery(query, model)
expect_match(class(queryResult), "QueryResult")

# Retrieve query results and check the actual result count against the expected count
result <- getNextResult(queryResult)
i <- 0
while(!is.null(result)) {
  i <- i + 1
  # Something went wrong, break loop
  if(i > 5) {
    break
  }
  expect_match(class(result), "list")
  result <- getNextResult(queryResult)
}
expect_that(i, equals(5))

freeQuery(query)
rm(query)
freeQueryResults(queryResult)
rm(queryResult)

# Query the RDF model with a new query that should only have one triple returned
queryString <- 'PREFIX orcid: <https://orcid.org/> PREFIX dataone: <https://cn.dataone.org/cn/v1/resolve/> PREFIX prov: <http://www.w3.org/ns/prov#> SELECT ?a ?c WHERE { ?a prov:Agent ?c . }'
query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
expect_match(class(query), "Query")
queryResult <- executeQuery(query, model)
expect_match(class(queryResult), "QueryResult")

# Retrieve query results and check the actual result count against the expected count
result <- getNextResult(queryResult)
i <- 0
while(! is.null(result)) {
  i <- i + 1
  # Something went wrong, break loop
  if(i > 5) {
    break
  }
  expect_match(class(result), "list")
  result <- getNextResult(queryResult)
}
expect_that(i, equals(1))

freeQuery(query)
rm(query)
freeQueryResults(queryResult)
rm(queryResult)
freeStorage(storage)
rm(storage)
freeModel(model)
rm(model)
freeWorld(world)
rm(world)

world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world, storage, options="")

# Specific test for retrieval of literal values
stmt <- new("Statement", 
            world = world,  
            subject="", 
            predicate="http://schema.org/name", 
            object="Charles Mingus")
addStatement(model, stmt)

query <-'SELECT ?s ?p ?o WHERE { ?s ?p ?o}'
queryObj <- new("Query", world, query)
queryResult <- executeQuery(queryObj, model)
r <-getNextResult(queryResult)

expect_match(r$o, "\"Charles Mingus\"")

freeQuery(queryObj)
rm(queryObj)
freeQueryResults(queryResult)
rm(queryResult)
freeStorage(storage)
rm(storage)
freeModel(model)
rm(model)
freeWorld(world)
rm(world)

world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world, storage, options="")

# Literal for object node has RDF language tag
stmt <- new("Statement", 
            world = world,  
            subject="", 
            predicate="http://schema.org/name", 
            object="Maëlle Salmon",
            language="fr")
addStatement(model, stmt)

query <-'SELECT ?s ?p ?o WHERE { ?s ?p ?o}'
queryObj <- new("Query", world, query)
queryResult <- executeQuery(queryObj, model)
r <-getNextResult(queryResult)

# The Redlands library can return UTF characters that are outside the
# ASCII range as the unicode literal string, i.e.  https://en.wikipedia.org/wiki/List_of_Unicode_characters.
# If 'stringi' is available, then check the original representation, otherwise check the escaped codepoint
# representation.
if(require("stringi", character.only = TRUE)) {
    expect_match(stringi::stri_unescape_unicode(r$o), "Maëlle Salmon")
} else {
    expect_match(r$o, '"Ma\\\\u00EBlle Salmon"@fr')
}

freeQuery(queryObj)
rm(queryObj)
freeQueryResults(queryResult)
rm(queryResult)
freeStorage(storage)
rm(storage)
freeModel(model)
rm(model)
freeWorld(world)
rm(world)
  
})


test_that("getResults, writeResults work", {
  library(redland)
  world <- new("World")
  expect_false(is.null(world))
  storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
  model <- new("Model", world, storage, options="")
  stmt <- new("Statement", world=world, 
     subject="https://orcid.org/0000-0002-2192-403X",
     predicate="http://www.w3.org/ns/prov#Agent",
     object="slaughter", 
     objectType="literal", datatype_uri="http://www.w3.org/2001/XMLSchema#string")
  status <- addStatement(model, stmt)
  queryString <- paste("PREFIX orcid: <https://orcid.org/>",
                        "PREFIX dataone: <https://cn.dataone.org/cn/v1/resolve/>",
                        "PREFIX prov: <http://www.w3.org/ns/prov#>",
                        "SELECT ?a ?c WHERE { ?a prov:Agent ?c . }", sep=" ")
  query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
  # Return all results as a string
  results <- getResults(query, model, "rdfxml")
  expect_true(grepl("0000-0002-2192-403X", results))
  expect_true(grepl("slaughter", results))
  
  results <- getResults(query, model, "turtle")
  expect_true(grepl("slaughter", results))
  expect_true(grepl("0000-0002-2192-403X", results))
  
  results <- getResults(query, model, "json")
  expect_true(grepl("slaughter", results))
  expect_true(grepl("0000-0002-2192-403X", results))
   
  # When the query object is no longer needed, the resources it had allocated can be freed.
  freeQuery(query)
  rm(query)
  
  # Test writeResults
  world <- new("World")
  storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
  model <- new("Model", world, storage, options="")
  stmt <- new("Statement", world=world, 
     subject="https://orcid.org/0000-0002-2192-403X",
     predicate="http://www.w3.org/ns/prov#Agent",
     object="slaughter", 
     objectType="literal", datatype_uri="http://www.w3.org/2001/XMLSchema#string")
  status <- addStatement(model, stmt)
  queryString <- paste("PREFIX orcid: <https://orcid.org/>",
                        "PREFIX dataone: <https://cn.dataone.org/cn/v1/resolve/>",
                        "PREFIX prov: <http://www.w3.org/ns/prov#>",
                        "SELECT ?a ?c WHERE { ?a prov:Agent ?c . }", sep=" ")
  query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
  # Return all results as a string
  tf <- tempfile()
  writeResults(query, model, file=tf, mimeType="application/x-turtle")
  inbuf <- readLines(tf)
  expect_true(any(grepl("slaughter", inbuf)))
  expect_true(any(grepl("0000-0002-2192-403X", inbuf)))
  
  # Ntriples
  tf <- tempfile()
  writeResults(query, model, file=tf, mimeType="text/plain")
  inbuf <- readLines(tf)
  expect_true(any(grepl("slaughter", inbuf)))
  expect_true(any(grepl("0000-0002-2192-403X", inbuf)))
  
  tf <- tempfile()
  writeResults(query, model, file=tf, mimeType="application/json")
  inbuf <- readLines(tf)
  expect_true(any(grepl("slaughter", inbuf)))
  expect_true(any(grepl("0000-0002-2192-403X", inbuf)))
  
  tf <- tempfile()
  writeResults(query, model, file=tf, mimeType="text/html")
  inbuf <- readLines(tf)
  expect_true(any(grepl("slaughter", inbuf)))
  expect_true(any(grepl("0000-0002-2192-403X", inbuf)))
  
  # When the query object is no longer needed, the resources it had allocated can be freed.
  freeQuery(query)
  rm(query)
  freeStorage(storage)
  rm(storage)
  freeModel(model)
  rm(model)
  freeWorld(world)
  rm(world) 
})