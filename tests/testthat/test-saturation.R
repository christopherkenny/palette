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
