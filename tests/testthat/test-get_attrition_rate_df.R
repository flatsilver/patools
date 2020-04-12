test_that("multiplication works", {
  df <- data.frame(
    entry_year = rep(c("FY17", "FY18", "FY19"), 3),
    tenure = c(0, 0, 0, 1, 1, 0, 2, 1, 0),
    attrition_flg = c(0, 0, 0, 1, 0, 1, 1, 1, 0),
    stringsAsFactors = FALSE
  )

  expect <- data.frame(
    entry_year = c("FY17", "FY18", "FY19"),
    `0` = c(NA_character_, NA_character_, "1\n(33.3%)"),
    `1` = c("1\n(33.3%)", "1\n(33.3%)", NA_character_),
    `2` = c("2\n(66.7%)", NA_character_, NA_character_),
    n   = c(rep(3L, 3)),
    check.names = FALSE,
    stringsAsFactors = FALSE
  )

  expect_equal(get_attrition_rate_df(df, entry_year, tenure, attrition_flg),
               expect)
})
