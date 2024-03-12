test_that("formatting works", {
  verify_output(
    path = 'test-print.txt',
    print(palette(roygbiv))
  )

  verify_output(
    path = 'test-print-na.txt',
    print(palette(c(roygbiv, NA_character_)))
  )
})

test_that("pillars works", {
  verify_output(
    path = 'test-pillar.txt',
    pillar::pillar(palette(roygbiv))
  )

  verify_output(
    path = 'test-pillar-na.txt',
    pillar::pillar(palette(c(roygbiv, NA_character_)))
  )
})
