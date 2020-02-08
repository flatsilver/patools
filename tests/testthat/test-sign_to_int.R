test_that("signt_to_int() replace with sign to integer", {
  x <- c("A+", "B", NA_character_, "N", "-", "B+", "D")
  expected <- c(9, 5, NA_integer_, NA_integer_, NA_integer_,
                6, 0)

  expect_equal(sign_to_int(x), expected)
})
