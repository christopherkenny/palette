test_that('browsing works', {
  expect_error(palette_browse())

  expect_equal(
    palette_browse(roygbiv),
    'https://coolors.co/FF4444-FFAE4D-FFFF60-50FF50-3939FA-AB3FFB-F68BF6'
  )
})

test_that('decoding works', {
  expect_error(palette_decode_url())

  expect_equal(
    palette_decode_url('https://coolors.co/ff4444-ffae4d-ffff60-50ff50-3939fa'),
    palette(c('#FF4444', '#FFAE4D', '#FFFF60', '#50FF50', '#3939FA'))
  )

  expect_equal(
    palette_decode_url('https://www.colorhunt.co/palette/b5c0d0ccd3caf5e8ddeed3d9'),
    palette(c('#B5C0D0', '#CCD3CA', '#F5E8DD', '#EED3D9'))
  )

  expect_error(palette_decode_url('fakecolors.com/blue'))
})
