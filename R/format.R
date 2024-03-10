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
  if (vctrs::vec_is_empty(x)) {
    return(character())
  }

  vctrs::vec_data(x)

}
