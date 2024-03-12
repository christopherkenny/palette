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
  l[is.na(x)] <- NA_real_

  fmt_x <- paste0(' ', format(x), ' ')
  # out <- character(length(x))
  # out[is.na(x)] <- '<NA>'
  # out[l > 0.5] <- cli::col_black(cli::make_ansi_style(x[!is.na(x) & l > 0.5], bg = TRUE)(fmt_x[l > 0.5]))
  # out[l <= 0.5] <- cli::col_white(cli::make_ansi_style(x[!is.na(x) & l <= 0.5], bg = TRUE)(fmt_x[l <= 0.5]))
  bg_fns <- stats::setNames(
    lapply(unique(stats::na.omit(x)), function(col) {cli::make_ansi_style(col, bg = TRUE)}),
    unique(stats::na.omit(x))
  )

  out <- vapply(
    seq_along(x),
    function(i) {
      if (is.na(x[[i]])) {
        return('<NA>')
      }
      bg_fns[[x[[i]]]](fmt_x[i])
    },
    FUN.VALUE = character(1)
  )

  if (any(!is.na(l) & l > 0.5)) {
    out[l > 0.5] <- cli::col_black(out[!is.na(l) & l > 0.5])
  }
  if (any(!is.na(l) & l <= 0.5)) {
    out[l <= 0.5] <- cli::col_white(out[!is.na(l) & l <= 0.5])
  }

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
      cur_char <- chars[i] + 5
      cat(lpad(paste0('[', row_id, '] '), 5))
      new_row <- FALSE
    }
    cat(paste0(out[[i]], ' '))
    cur_char <- cur_char + chars[[i]] + 1

    if (i != len && ((cur_char + chars[[i + 1]]) > width_console)) {
      cat('\n')
      new_row <- TRUE
      row_id <- row_id + 1
    }
  }

  # give a heads up if truncated
  if (vec_size(out) > max_print) {
    cat('\n[ reached getOption("max.print") -- omitted', vec_size(out) - max_print, 'entries.]\n')
  }

  invisible(x)
}

#' @export
pillar_shaft.palette <- function(x, ...) {

  l <- hex_to_luminosity(x)

  fmt_x <- paste0(' ', format(x), ' ')
  out <- vapply(
    seq_along(x),
    function(i) {
      if (is.na(x[[i]])) {
        return('<NA>')
      }
      cli::make_ansi_style(x[[i]], bg = TRUE)(fmt_x[[i]])
    },
    FUN.VALUE = character(1)
  )

  if (any(!is.na(l) & l > 0.5)) {
    out[l > 0.5] <- cli::col_black(out[!is.na(l) & l > 0.5])
  }
  if (any(!is.na(l) & l <= 0.5)) {
    out[l <= 0.5] <- cli::col_white(out[!is.na(l) & l <= 0.5])
  }

  pillar::new_pillar_shaft_simple(out, align = 'center')
}
