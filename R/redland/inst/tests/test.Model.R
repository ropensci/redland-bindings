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
})