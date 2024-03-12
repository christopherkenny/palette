#' Create a palette
#'
#' @param x A character vector of colors
#'
#' @return a palette vector
#' @export
#'
#' @examples
#' palette(roygbiv)
palette <- function(x = character()) {
  #x <- rlang::list2(...)

  x <- vec_cast(x, 'character')
  new_palette(x)
}

new_palette <- function(x = character()) {
  x <- hex_from_name(x)
  new_vctr(x, class = 'palette')
}

#' @export
#' @rdname palette
validate_palette <- function(x) {
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

