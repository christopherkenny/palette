test_that('plotting works no vdiffr', {
  p <- plot(palette(roygbiv))
  expect_s3_class(p, 'gg')
  expect_length(p$data$col, 36) # length 7 -> 3x3 * 4 entries each

  expect_null(plot_palette(named_pal, use_ggplot = FALSE))
})

test_that('plotting handles empty palettes and rejects all-missing palettes', {
  p <- plot_palette(palette(character()))
  expect_s3_class(p, 'gg')
  expect_equal(nrow(p$data), 0)

  expect_error(plot_palette(palette(NA_character_)))
  expect_error(plot_palette(palette(c(NA_character_, NA_character_))))
})

test_that('plotting works with vdiffr', {
  skip_if_not_installed('vdiffr')
  vdiffr::expect_doppelganger(
    'plot-palette-ggplot',
    plot(palette(roygbiv))
  )

  vdiffr::expect_doppelganger(
    'plot-palette-base',
    plot_palette(named_pal, use_ggplot = FALSE)
  )
})
