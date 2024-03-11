#' @export
plot.palette <- function(x, ...) {
  plot_palette(x, ...)
}

#' Plot Palette Colors
#'
#' @param x a palette
#' @param use_names Should the names of the palette be used as labels? Default: `TRUE`.
#'
#' @return A `ggplot` (if ggplot2 is available) or base plot of the palette
#' @export
#'
#' @examples
#' plot_palette(c('#ED0A3F', '#0066FF', '#FBE870', '#01A638', '#FF681F'))
plot_palette <- function(x, use_names = TRUE) {
  n <- length(x)
  x_in <- stats::setNames(x, x)

  # convert to square-able
  nc <- ceiling(sqrt(n))
  nr <- ceiling(n / nc)
  x <- c(x, rep(NA_character_, (nr * nc) - n))

  # ggplot it ----
  box <- bocks(nr, nc)
  sq <- data.frame(
    col = rep(vec_data(x), each = 4),
    x = box$x,
    y = -box$y
  )


  if (use_names && !is.null(vec_names(x))) {
    labs <- paste0(vec_names(x), '\n', vec_data(x))
  } else {
    labs <- vec_data(x)
  }

  label_loc <- data.frame(
    col = labs,
    x = box$x[seq(1, length(x) * 4, by = 4)] + 0.5,
    y = -(box$y[seq(1, length(x) * 4, by = 4)] + 0.5)
  )
  label_loc$col[is.na(label_loc$col)] <- ''

  label_loc$color <- ifelse(hex_to_luminosity(x) > 0.5, 'black', 'white')

  if (requireNamespace('ggplot2', quietly = TRUE)) {
    # if ggplot2 is available, return a ggplot
    # fake pronoun = ggplot2::.data will fail, so define to avoid warning
    .data <- ggplot2::.data

    # make the plot:
    ggplot2::ggplot(sq, ggplot2::aes(x = .data$x, y = .data$y)) +
      ggplot2::geom_polygon(ggplot2::aes(fill = col)) +
      ggplot2::geom_text(data = label_loc, ggplot2::aes(label = .data$col, color = .data$color)) +
      ggplot2::guides(fill = 'none', color = 'none') +
      ggplot2::scale_fill_manual(values = x_in, na.value = 'white') +
      ggplot2::scale_color_identity() +
      ggplot2::coord_fixed() +
      ggplot2::theme_void()
  } else {
    # otherwise make a base plot

    sq <- sq[!is.na(sq$col), ]
    # Plot tiles
    plot(NULL, axes = FALSE, xlab = '', ylab = '',
         xlim = c(0, nc), ylim = c(0, nr), asp = 1)
    graphics::rect(xleft = sq$x[(seq_along(x) * 4) - 3],
         xright = sq$x[(seq_along(x) * 4) - 2],
         ybottom = sq$y[(seq_along(x) * 4) - 3],
         ytop = sq$y[(seq_along(x) * 4)],
         col = x_in)

    # Add text
    graphics::text(label_loc$x, label_loc$y, labels = label_loc$col, col = label_loc$color)
  }
}
