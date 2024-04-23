test_that('darkening works', {
  expect_equal(
    darken(roygbiv),
    c('#565652', '#C3C361', '#FFFF67', '#FFFF69', '#4343FF', '#4E4EFF', '#9F9FFF')
  )

  expect_s3_class(
    darken(palette(roygbiv)),
    'palette'
  )
})

test_that('lightening works', {
  expect_equal(
    lighten(roygbiv),
    c('#303037', '#999938', '#E3E343', '#E5E535', '#2F2FEE', '#2F2FEC', '#7777E1')
  )

  expect_s3_class(
    lighten(palette(roygbiv)),
    'palette'
  )
})
