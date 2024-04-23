#' Browse a palette on coolors.co
#'
#' @param x A palette
#'
#' @return A URL to the palette
#' @export
#'
#' @examples
#' palette_browse(roygbiv)
palette_browse <- function(x) {
  # , site = c('coolors', 'colorhunt')
  if (missing(x)) {
    cli::cli_abort('You must provide a palette as {.arg x} to browse.')
  }

  site <- 'coolors' # match.arg(site)

  # if (site == 'coolors') {
  x <- substr(x, 2, 7)
  link <- paste0('https://coolors.co/', paste0(x, collapse = '-'))
  # } else if (site == 'colorhunt') {
  #   x <- substr(x, 2, 7)
  #   if (length(x) > 4) {
  #     x <- x[1:4]
  #     cli::cli_warn(c('Colorhunt palettes are limited to 4 colors.',
  #                     i = 'Only the first 4 colors will be used.'))
  #   }
  #   link <- paste0('https://www.colorhunt.co/palette/', paste0(x, collapse = ''))
  # }# else {
  #  cli::cli_abort('{.arg site} must be {.val coolors}, {.val colorhunt}')
  # }

  if (interactive()) { # nocov start
    utils::browseURL(link)
  } # nocov end
  link
}

#' @rdname palette_browse
#' @export
palette_browse_url <- palette_browse

#' Convert a URL to a palette
#'
#' This function takes a URL from either <coolors.co> or <colorhunt.co> and
#' returns the palette.
#'
#' @param x A URL from either 'coolors.co' or 'colorhunt.co'
#'
#' @return a vector of type `palette`
#' @export
#'
#' @examples
#' palette_decode_url('https://coolors.co/ff4444-ffae4d-ffff60-50ff50-3939fa')
#' palette_decode_url('https://www.colorhunt.co/palette/b5c0d0ccd3caf5e8ddeed3d9')
palette_decode_url <- function(x) {
  if (missing(x)) {
    cli::cli_abort('You must provide a URL as {.arg x} to decode.')
  }

  if (grepl('coolors.co', x)) {
    x <- gsub('https://coolors.co/', '', x)
    x <- unlist(strsplit(x, '-'))
    x <- toupper(paste0('#', x))
  } else if (grepl('colorhunt.co', x)) {
    x <- gsub('https://www.colorhunt.co/palette/', '', x)
    nc <- nchar(x)
    break_pts <- seq(1, nc, by = 6)
    end_pts <- break_pts + 5L
    x <- toupper(paste0('#', substring(x, break_pts, end_pts)))
  } else {
    cli::cli_abort('The URL must be from either coolors.co or colorhunt.co')
  }
  palette(x)
}
