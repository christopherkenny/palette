test_that('darkening works', {
  expect_equal(
    darken(roygbiv),
    c('#FF5652', '#FFC361', '#FFFF67', '#71FF69', '#4B43FF', '#BA4EFF', '#FF9FFF')
  )

  expect_s3_class(
    darken(palette(roygbiv)),
    'palette'
  )
})

test_that('lightening works', {
  expect_equal(
    lighten(roygbiv),
    c('#EC3037', '#E79938', '#E2E343', '#25E535', '#212FEE', '#9C2FEC', '#E177E1')
  )

  expect_s3_class(
    lighten(palette(roygbiv)),
    'palette'
  )
})
