context("World tests")
test_that("redland library loads", {
    library(redland)
})
test_that("World constructor", {
    library(redland)
    world <- new("World");
    expect_that(class(world), matches("World"))
    expect_that(class(world@world), matches("_p_librdf_world_s"))
})