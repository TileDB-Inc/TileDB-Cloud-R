# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate

context("Test SubarrayPartitioner")

model.instance <- SubarrayPartitioner$new()

test_that("subarray", {
  # tests for the property `subarray` (Subarray)

  # uncomment below to test the property 
  #expect_equal(model.instance$`subarray`, "EXPECTED_RESULT")
})

test_that("budget", {
  # tests for the property `budget` (array[AttributeBufferSize])
  # Result size budget (in bytes) for all attributes.

  # uncomment below to test the property 
  #expect_equal(model.instance$`budget`, "EXPECTED_RESULT")
})

test_that("current", {
  # tests for the property `current` (SubarrayPartitionerCurrent)

  # uncomment below to test the property 
  #expect_equal(model.instance$`current`, "EXPECTED_RESULT")
})

test_that("state", {
  # tests for the property `state` (SubarrayPartitionerState)

  # uncomment below to test the property 
  #expect_equal(model.instance$`state`, "EXPECTED_RESULT")
})

test_that("memoryBudget", {
  # tests for the property `memoryBudget` (integer)
  # The memory budget for the fixed-sized attributes and the offsets of the var-sized attributes

  # uncomment below to test the property 
  #expect_equal(model.instance$`memoryBudget`, "EXPECTED_RESULT")
})

test_that("memoryBudgetVar", {
  # tests for the property `memoryBudgetVar` (integer)
  # The memory budget for the var-sized attributes

  # uncomment below to test the property 
  #expect_equal(model.instance$`memoryBudgetVar`, "EXPECTED_RESULT")
})

