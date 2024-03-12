test_that("palette casting works", {
  expect_type(as.character(palette(roygbiv)), 'character')

  expect_identical(as_palette(roygbiv), palette(roygbiv))

  expect_error(as_palette(list(roygbiv)))

  # works with NAs
  expect_identical(as_palette(NA), palette(NA))
  expect_identical(as_palette(NA_character_), palette(NA_character_))

  # works with crayons style palette
  test_vec <- structure(c('orange'), class = c('test', 'character'))
  expect_identical(as_palette(test_vec), palette('orange'))

  # breaks on unknown class
  test_vec <- structure(c('orange', 'blue'), class = c('alphabet'))
  expect_error(as_palette(test_vec))

  # no conversion on NULL
  expect_null(as_palette(NULL))
})
