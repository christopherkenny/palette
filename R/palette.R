#' Create a palette
#'
#' A `palette` is a class for color palettes built on `vctrs`. It is represented
#' as a character vector of hexadecimal color codes. Named colors (like `'red'`)
#' are translated to hexadecimal color codes.
#'
#' @param x A character vector of colors
#'
#' @return a palette vector
#' @export
#'
#' @examples
#' palette(roygbiv)
palette <- function(x = character()) {
  # x <- rlang::list2(...)

  x <- vec_cast(x, 'character')
  new_palette(x)
}

new_palette <- function(x = character()) {
  x <- hex_from_name(x)
  validate_palette(x)
  new_vctr(x, class = 'palette')
}

#' @export
#' @rdname palette
validate_palette <- function(x) {
  valid <- is.na(x) | grepl('^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$', x)

  if (!all(valid)) {
    cli::cli_abort('{.arg x} must contain only valid hex colors of the form {.val #RRGGBB} or {.val #RRGGBBAA}.')
  }

  invisible(x)
}

#' @export
#' @rdname palette
is_palette <- function(x) {
  inherits(x, 'palette')
}

#' @export
#' @rdname palette
as_palette <- function(x) {
  if (inherits(x, 'character')) {
    x <- as.character(x)
  }
  vec_cast(x, to = new_palette())
}
