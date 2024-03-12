test_that("coercion works", {
  expect_s3_class(vctrs::vec_c(palette(roygbiv), palette(roygbiv)), 'palette')

  expect_s3_class(vctrs::vec_c(roygbiv, palette(roygbiv)), 'palette')

  test_vec <- structure('orange', class = c('color', 'character'))
  expect_type(c(test_vec, palette(roygbiv)), 'character')
})
