test_that("`palette_function()` works", {
  expect_true(is.function(palette_function(roygbiv)))

  expect_length(palette_function(roygbiv)(2), 2)
  expect_length(palette_function(roygbiv)(20), 20)
})
