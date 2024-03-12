test_that("`palette` works", {
  expect_s3_class(palette(roygbiv), "palette")

  expect_true(is_palette(palette(roygbiv)))

  expect_s3_class(as_palette(roygbiv), "palette")

  expect_s3_class(validate_palette(palette(roygbiv)), "palette")
})
