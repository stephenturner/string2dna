test_that("Encoding", {
  expect_equal(string2dna("Stephen Turner", method="encode"), "TGATAGCTAGAGCGTCTACTCAGCTAGGATCACCTCCTACAC")
  expect_equal(string2dna("TGATAGCTAGAGCGTCTACTCAGCTAGGATCACCTCCTACAC", method="decode"), "STEPHEN TURNER")
  expect_error(string2dna("Hello+?", method="encode"))
  expect_error(string2dna("ACGTA", method="decode"))
  expect_error(string2dna("ACGTAU", method="decode"))
  expect_error(string2dna("ACGTGC", method="wrong"))
})
