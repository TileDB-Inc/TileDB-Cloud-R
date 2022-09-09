
if (requireNamespace("tinytest", quietly=TRUE))  {
    tiledbcloud::login()
    tinytest::test_package("tiledbcloud")
}
