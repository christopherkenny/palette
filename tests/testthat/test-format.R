test_that("formatting works", {
  verify_output(
    path = 'output-print.txt',
    print(palette(roygbiv))
  )

  verify_output(
    path = 'output-print-na.txt',
    print(palette(c(roygbiv, NA_character_)))
  )
})

test_that("pillars works", {
  verify_output(
    path = 'output-pillar.txt',
    pillar::pillar(palette(roygbiv))
  )

  verify_output(
    path = 'output-pillar-na.txt',
    pillar::pillar(palette(c(roygbiv, NA_character_)))
  )
})

test_that('overflow works', {
  verify_output(
    path = 'output-print-overflow.txt',
    print(palette(rep(NA, 1001)))
  )
})

test_that('empty print works', {
  verify_output(
    path = 'output-print-empty.txt',
    print(palette(x = character()))
  )
})

test_that('empty format works', {
  expect_identical(format(palette(x = character())), character(0))
})
