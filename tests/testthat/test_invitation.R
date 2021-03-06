# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate

context("Test Invitation")

model.instance <- Invitation$new()

test_that("id", {
  # tests for the property `id` (character)
  # Unique id of invitation added to magic link

  # uncomment below to test the property 
  #expect_equal(model.instance$`id`, "EXPECTED_RESULT")
})

test_that("invitation_type", {
  # tests for the property `invitation_type` (InvitationType)

  # uncomment below to test the property 
  #expect_equal(model.instance$`invitation_type`, "EXPECTED_RESULT")
})

test_that("owner_namespace_uuid", {
  # tests for the property `owner_namespace_uuid` (character)
  # Namespace of the owner of the invitation (user or organization)

  # uncomment below to test the property 
  #expect_equal(model.instance$`owner_namespace_uuid`, "EXPECTED_RESULT")
})

test_that("user_namespace_uuid", {
  # tests for the property `user_namespace_uuid` (character)
  # Unique id of the user accepted the invitation

  # uncomment below to test the property 
  #expect_equal(model.instance$`user_namespace_uuid`, "EXPECTED_RESULT")
})

test_that("organization_user_uuid", {
  # tests for the property `organization_user_uuid` (character)
  # Unique id of the organization user accepted the invitation

  # uncomment below to test the property 
  #expect_equal(model.instance$`organization_user_uuid`, "EXPECTED_RESULT")
})

test_that("organization_name", {
  # tests for the property `organization_name` (character)
  # Name of the organization, does not persist in database

  # uncomment below to test the property 
  #expect_equal(model.instance$`organization_name`, "EXPECTED_RESULT")
})

test_that("organization_role", {
  # tests for the property `organization_role` (OrganizationRoles)

  # uncomment below to test the property 
  #expect_equal(model.instance$`organization_role`, "EXPECTED_RESULT")
})

test_that("array_uuid", {
  # tests for the property `array_uuid` (character)
  # Unique id of the array

  # uncomment below to test the property 
  #expect_equal(model.instance$`array_uuid`, "EXPECTED_RESULT")
})

test_that("array_name", {
  # tests for the property `array_name` (character)
  # Name of the array, does not persist in database

  # uncomment below to test the property 
  #expect_equal(model.instance$`array_name`, "EXPECTED_RESULT")
})

test_that("email", {
  # tests for the property `email` (character)
  # Email of the individual we send the invitation to

  # uncomment below to test the property 
  #expect_equal(model.instance$`email`, "EXPECTED_RESULT")
})

test_that("actions", {
  # tests for the property `actions` (character)
  # A comma separated list of ArrayActions or NamespaceActions

  # uncomment below to test the property 
  #expect_equal(model.instance$`actions`, "EXPECTED_RESULT")
})

test_that("status", {
  # tests for the property `status` (InvitationStatus)

  # uncomment below to test the property 
  #expect_equal(model.instance$`status`, "EXPECTED_RESULT")
})

test_that("created_at", {
  # tests for the property `created_at` (character)
  # Datetime the invitation was created in UTC

  # uncomment below to test the property 
  #expect_equal(model.instance$`created_at`, "EXPECTED_RESULT")
})

test_that("expires_at", {
  # tests for the property `expires_at` (character)
  # Datetime the invitation is expected to expire in UTC

  # uncomment below to test the property 
  #expect_equal(model.instance$`expires_at`, "EXPECTED_RESULT")
})

test_that("accepted_at", {
  # tests for the property `accepted_at` (character)
  # Datetime the invitation was accepted in UTC

  # uncomment below to test the property 
  #expect_equal(model.instance$`accepted_at`, "EXPECTED_RESULT")
})

