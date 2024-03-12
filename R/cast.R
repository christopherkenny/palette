#' Palette Casting
#'
#' Dispatch methods for [vctrs::vec_cast()]
#'
#' @inheritParams vctrs::vec_cast
#'
#' @keywords internal
#' @method vec_cast palette
#' @export
vec_cast.palette <- function(x, to, ...) {
  UseMethod('vec_cast.palette')
}

#' @method vec_cast.palette default
#' @export
vec_cast.palette.default <- function(x, to, ...) vec_default_cast(vec_data(x), to, ...)

#' @method vec_cast.palette character
#' @export
vec_cast.palette.character <- function(x, to, ...) palette(x)

#' @method vec_cast.character palette
#' @export
vec_cast.character.palette <- function(x, to, ...) vec_data(x)
