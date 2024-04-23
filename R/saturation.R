#' Control palette saturation
#'
#' Generic function to control the saturation of a palette.
#'
#' @param x A vector of colors
#' @param amount A numeric value to control the saturation of the palette
#' @param ... Additional arguments passed to other methods. Currently ignored.
#'
#' @name saturation
#'
#' @return A palette vector with the saturation adjusted
#'
#' @examples
#' saturate(palette(roygbiv))
#' desaturate(palette(roygbiv))
NULL

#' @rdname saturation
#' @export
saturate <- function(x, amount = .1, ...) {
  UseMethod('saturate')
}

#' @rdname saturation
#' @export
desaturate <- function(x, amount = .1, ...) {
  UseMethod('desaturate')
}

#' @rdname saturation
#' @export
saturate.default <- function(x, amount = .1, ...) {
  adjust_saturation(x, 1 + amount)
}

#' @rdname saturation
#' @export
saturate.palette <- function(x, amount = .1, ...) {
  palette(adjust_saturation(x, 1 + amount))
}


#' @rdname saturation
#' @export
desaturate.default <- function(x, amount = .1, ...) {
  adjust_saturation(x, 1 - amount)
}

#' @rdname saturation
#' @export
desaturate.palette <- function(x, amount = .1, ...) {
  palette(adjust_saturation(x, 1 - amount))
}

adjust_saturation <- function(x, amount) {
  hsv_m <- convert_colors(x, from = 'sRGB', to = 'HSL')

  hsv_m[, 2] <- pmax(pmin(hsv_m[, 2] * (amount), 100), 0)

  srgb_m <- convert_colors(hsv_m, from = 'HSL', to = 'sRGB')

  out <- grDevices::rgb(srgb_m[, 1], srgb_m[, 2], srgb_m[, 3], maxColorValue = 255)
  vec_set_names(out, vec_names(x))
}
