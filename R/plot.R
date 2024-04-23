#' @export
plot.palette <- function(x, ...) {
  plot_palette(x, ...)
}

#' Plot Palette Colors
#'
#' @param x a palette
#' @param use_names Should the names of the palette be used as labels? Default: `TRUE`.
#' @param use_ggplot Should the plot be made with ggplot2 if available? Default: `TRUE`.
#'
#' @return A `ggplot` (if ggplot2 is available) or base plot of the palette
#' @export
#'
#' @examples
#' plot_palette(roygbiv)
plot_palette <- function(x, use_names = TRUE, use_ggplot = TRUE) {
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
  if (nrow(label_loc) > n) {
    label_loc$col[(n + 1):nrow(label_loc)] <- ''
  }

  label_loc$color <- ifelse(hex_to_luminosity(x) > 0.5, 'black', 'white')

  if (use_ggplot && requireNamespace('ggplot2', quietly = TRUE)) {
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
    label_loc <- label_loc[seq_len(n), ]

    # Plot tiles
    plot(NULL,
      axes = FALSE, xlab = '', ylab = '',
      xlim = c(0, nc), ylim = c(nr, 0), asp = 1
    )
    graphics::rect(
      xleft = sq$x[(seq_along(x) * 4) - 3],
      xright = sq$x[(seq_along(x) * 4) - 2],
      ybottom = -sq$y[(seq_along(x) * 4)],
      ytop = -sq$y[(seq_along(x) * 4) - 3],
      col = x_in
    )

    # Add text
    graphics::text(label_loc$x, -label_loc$y,
      labels = label_loc$col, col = label_loc$color
    )
  }
}
