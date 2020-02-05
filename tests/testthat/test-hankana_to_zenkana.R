test_that("hankana_to_zenkana() replace hankana with zenkana", {
  x <- "ﾊﾝｶｸｶﾀｶﾅﾊｱﾌﾞﾅｲ"
  y <- "123"
  z <- "ハンカクカタカナハアブナイ"

  expect_equal(hankana_to_zenkana(x), z)
  expect_equal(hankana_to_zenkana(y), "123")
})
