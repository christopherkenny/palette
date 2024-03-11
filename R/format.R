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

  l <- hex_to_luminosity(x)

  out <- vapply(
    seq_along(x),
    function(i) {
      if (l[i] > 0.5) {
        paste0(cli::col_black(cli::make_ansi_style(x[[i]], bg = TRUE)(paste0(' ', format(x[[i]]), ' '))))
      } else {
        paste0(cli::col_white(cli::make_ansi_style(x[[i]], bg = TRUE)(paste0(' ', format(x[[i]]), ' '))))
      }
    },
    FUN.VALUE = character(1)
  )
  cat(out)

  invisible(x)
}
