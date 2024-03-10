#' @export
vec_ptype_abbr.palette <- function(x, ...) {
  'pal'
}

#' @export
vec_ptype_full.palette <- function(x, ...) {
  'palette'
}

#' @export
format.palette <- function(x, ...) {
  if (vec_is_empty(x)) {
    return(character())
  }

  ifelse(is.na(x), '', vec_data(x))
}
