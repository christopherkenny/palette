test_that('saturating works', {
  expect_equal(
    saturate(roygbiv),
    c('#FF4343', '#FFAD4C', '#FFFF60', '#50FF50', '#3333FF', '#AB3BFF', '#FB85FB')
  )

  expect_s3_class(
    saturate(palette(roygbiv)),
    'palette'
  )
})

test_that('desaturating works', {
  expect_equal(
    desaturate(roygbiv),
    c('#F54D4D', '#F6AD55', '#F7F767', '#58F658', '#4242F0', '#A948F1', '#F090F0')
  )

  expect_s3_class(
    desaturate(palette(roygbiv)),
    'palette'
  )
})

test_that('saturation helpers preserve missing values', {
  x <- c('#FF0000', NA_character_, '#00FF00')

  expect_identical(
    is.na(saturate(x)),
    c(FALSE, TRUE, FALSE)
  )
  expect_identical(
    is.na(desaturate(x)),
    c(FALSE, TRUE, FALSE)
  )
  expect_identical(
    is.na(saturate(palette(x))),
    c(FALSE, TRUE, FALSE)
  )
  expect_identical(
    is.na(desaturate(palette(x))),
    c(FALSE, TRUE, FALSE)
  )
})
