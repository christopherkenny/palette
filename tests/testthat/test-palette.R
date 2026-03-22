test_that('`palette` works', {
  expect_s3_class(palette(roygbiv), 'palette')

  expect_true(is_palette(palette(roygbiv)))

  expect_s3_class(as_palette(roygbiv), 'palette')

  expect_s3_class(validate_palette(palette(roygbiv)), 'palette')

  expect_true(palette('red')[1] == '#FF0000')
})

test_that('`palette` rejects malformed hex colors', {
  expect_error(palette('#GGGGGG'))
  expect_error(palette('#12345'))
})
