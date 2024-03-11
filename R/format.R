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
  if (length(x) == 0) {
    return(character())
  }

  # ifelse(is.na(x), '<NA>', vec_data(x))
  vec_data(x)
}

#' @export
obj_print_data.palette <- function(x, ...) {
  if (length(x) == 0) {
    return(invisible(NULL))
  }

  # format
  l <- hex_to_luminosity(x)

  out <- vapply(
    seq_along(x),
    function(i) {
      if (is.na(x[[i]])) {
        return('<NA>')
      }
      if (l[i] > 0.5) {
        paste0(cli::col_black(cli::make_ansi_style(x[[i]], bg = TRUE)(paste0(' "', format(x[[i]]), '" '))))
      } else {
        paste0(cli::col_white(cli::make_ansi_style(x[[i]], bg = TRUE)(paste0(' "', format(x[[i]]), '" '))))
      }
    },
    FUN.VALUE = character(1)
  )

  # setup printing
  width_console <- cli::console_width()
  chars <- cli::ansi_nchar(out)

  max_print <- getOption('max.print')
  if (is.null(max_print)) max_print <- length(out)

  # print
  row_id <- 1
  new_row <- TRUE

  len <- min(vec_size(out), max_print)
  # assumes first row is always able to print once
  for (i in seq_len(len)) {
    if (new_row) {
      cur_char <- nchar(i) + 3
      cat(paste0('[', row_id, '] '))
      new_row <- FALSE
    }
    cat(paste0(' ', out[[i]], ' '))
    cur_char <- cur_char + chars[[i]] + 2

    if (i != len && ((cur_char + chars[[i + 1]]) > width_console)) {
      cat('\n')
      new_row <- TRUE
      row_id <- row_id + 1
    }
  }

  # give a heads up if truncated

  invisible(x)
}

#' @export
pillar_shaft.palette <- function(x, ...) {

  l <- hex_to_luminosity(x)

  out <- vapply(
    seq_along(x),
    function(i) {
      if (is.na(x[[i]])) {
        return('<NA>')
      }
      if (l[i] > 0.5) {
        paste0(cli::col_black(cli::make_ansi_style(x[[i]], bg = TRUE)(paste0(' ', format(x[[i]]), ' '))))
      } else {
        paste0(cli::col_white(cli::make_ansi_style(x[[i]], bg = TRUE)(paste0(' ', format(x[[i]]), ' '))))
      }
    },
    FUN.VALUE = character(1)
  )

  pillar::new_pillar_shaft_simple(out, align = 'center')
}
