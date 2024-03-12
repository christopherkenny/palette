named_hexcodes <- grDevices::col2rgb(col = colors()) |>
  apply(2, function(x) rgb(x[1], x[2], x[3], maxColorValue = 255)) |>
  setNames(colors())

usethis::use_data(named_hexcodes, internal = TRUE, overwrite = TRUE, version = 3)
