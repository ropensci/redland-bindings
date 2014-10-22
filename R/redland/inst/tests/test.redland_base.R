context("librdf base API tests")
test_that("redland library loads", {
    library(redland)
})
test_that("librdf basic functions", {
    library(redland)
    world <- librdf_new_world();
    expect_that(class(world), matches("_p_librdf_world_s"))
    storage <- librdf_new_storage(world,'hashes','dummy',"new=yes,hash-type='memory'")
    expect_that(class(storage), matches("_p_librdf_storage_s"))
    
    model <- librdf_new_model(world,storage,'')
    expect_that(class(model), matches("_p_librdf_model_s"))
    
    parser <- librdf_new_parser(world,'rdfxml','application/rdf+xml',NULL)
    expect_that(class(parser), matches("_p_librdf_parser_s"))
    uri <- librdf_new_uri(world,'file:../../../../data/dc.rdf')
    expect_that(class(uri), matches("_p_librdf_uri_s"))
    rv <- librdf_parser_parse_into_model(parser,uri,uri,model)
    expect_that(rv, equals(0))
    librdf_free_uri(uri);
    librdf_free_parser(parser);
})