# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate

context("Test PaginationMetadata")

model.instance <- PaginationMetadata$new()

test_that("page", {
  # tests for the property `page` (numeric)
  # pagination offset. Use it to skip the first ((page - 1) * per_page) items

  # uncomment below to test the property 
  #expect_equal(model.instance$`page`, "EXPECTED_RESULT")
})

test_that("per_page", {
  # tests for the property `per_page` (numeric)
  # pagination limit (page size)

  # uncomment below to test the property 
  #expect_equal(model.instance$`per_page`, "EXPECTED_RESULT")
})

test_that("total_pages", {
  # tests for the property `total_pages` (numeric)
  # number of total pages with current limit

  # uncomment below to test the property 
  #expect_equal(model.instance$`total_pages`, "EXPECTED_RESULT")
})

test_that("total_items", {
  # tests for the property `total_items` (numeric)
  # number of total available items

  # uncomment below to test the property 
  #expect_equal(model.instance$`total_items`, "EXPECTED_RESULT")
})

