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

  ifelse(is.na(x), '<NA>', vec_data(x))
}

#' @export
obj_print_data.palette <- function(x, ...) {
  if (length(x) == 0) {
    return(invisible(NULL))
  }

  out <- vapply(seq_along(x),
                function(i) {
                  paste0(cli::make_ansi_style(x[[i]], bg = TRUE)('  '), format(x[[i]]))
                }, FUN.VALUE = character(1))
  cat(out)

  invisible(x)
}
