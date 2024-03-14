#' Palette Coercion
#'
#' Coercion methods for [vctrs::vec_ptype2()]
#'
#' @inheritParams vctrs::vec_ptype2
#'
#' @return a vector of the same length, as class `palette` if convertible, otherwise `character`
#'
#' @keywords internal
#' @method vec_ptype2 palette
#' @export
#' @export vec_ptype2.palette
vec_ptype2.palette <- function(x, y, ...) {
  UseMethod('vec_ptype2.palette', y)
}

#' @method vec_ptype2.palette default
#' @export
vec_ptype2.palette.default <- function(x, y, ..., x_arg = '', y_arg = '') {
  vec_default_ptype2(x, y, ..., x_arg = x_arg, y_arg = y_arg)
}

#' @method vec_ptype2.palette palette
#' @export
vec_ptype2.palette.palette <- function(x, y, ...) {
  new_palette()
}

#' @method vec_ptype2.palette character
#' @export
vec_ptype2.palette.character <- function(x, y, ..., x_arg = '', y_arg = '') {
  new_palette()
}

#' @method vec_ptype2.character palette
#' @export
vec_ptype2.character.palette <- function(x, y, ..., x_arg = '', y_arg = '') {
  new_palette()
}
