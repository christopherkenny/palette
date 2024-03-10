#' Create a palette
#'
#' @param x A character vector of colors
#'
#' @return a palette vector
#' @export
#'
#' @examples
#' palette(c('#ED0A3F', '#0066FF', '#01A638'))
palette <- function(x = character()) {
  #x <- rlang::list2(...)

  x <- vctrs::vec_cast(x, 'character')
  new_palette(x)
}

new_palette <- function(x = character()) {
  vctrs::new_vctr(x, class = 'palette')
}

#' @export
#' @rdname palette
validate_palette <- function(x) {
  x
}

#' @export
#' @rdname palette
is_palette <- function(x) {
  inherits(x, 'palette')
}

#' @export
#' @rdname palette
as_palette <- function(x) {
  vctrs::vec_cast(x, new_palette())
}

