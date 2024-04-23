#' Control palette brightness
#'
#' Generic function to control the brightness of a palette.
#'
#' @param x A vector of colors
#' @param amount A numeric value to control the brightness of the palette
#' @param ... Additional arguments passed to other methods. Currently ignored.
#'
#' @name brightness
#'
#' @return A palette vector with the brightness adjusted
#'
#' @examples
#' darken(palette(roygbiv))
#' lighten(palette(roygbiv))
NULL

#' @rdname brightness
#' @export
darken <- function(x, amount = .1, ...) {
  UseMethod('darken')
}

#' @rdname brightness
#' @export
lighten <- function(x, amount = .1, ...) {
  UseMethod('lighten')
}

#' @rdname brightness
#' @export
darken.default <- function(x, amount = .1, ...) {
  adjust_palette(x, 1 + amount)
}

#' @rdname brightness
#' @export
darken.palette <- function(x, amount = .1, ...) {
  palette(adjust_palette(x, 1 + amount))
}


#' @rdname brightness
#' @export
lighten.default <- function(x, amount = .1, ...) {
  adjust_palette(x, 1 - amount)
}

#' @rdname brightness
#' @export
lighten.palette <- function(x, amount = .1, ...) {
  palette(adjust_palette(x, 1 - amount))
}

adjust_palette <- function(x, amount) {
  srgb <- grDevices::col2rgb(vec_data(x))
  lab_m <- grDevices::convertColor(t(srgb), from = 'sRGB', to = 'Lab', scale.in = 255)

  lab_m[, 1] <- pmax(pmin(lab_m[, 1] * (amount), 100), 0)

  srgb_m <- grDevices::convertColor(lab_m, from = 'Lab', to = 'sRGB')

  out <- grDevices::rgb(srgb_m[, 2], srgb_m[, 2], srgb_m[, 3], maxColorValue = 1)
  vec_set_names(out, vec_names(x))
}
