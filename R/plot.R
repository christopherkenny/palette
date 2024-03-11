#' @export
plot.palette <- function(x, ...) {
  plot_palette(x)
}

#' Plot Palette Colors
#'
#' @param x A palette
#'
#' @return A `ggplot` (if ggplot2 is available) or base plot of the palette
#' @export
#'
#' @examples
#' plot_palette(crayons$standard16)
plot_palette <- function(x) {
  n <- length(x)
  x_in <- stats::setNames(x, x)

  # convert to square-able
  nc <- ceiling(sqrt(n))
  nr <- ceiling(n / nc)
  x <- c(x, rep(NA_character_, (nr * nc) - n))

  # ggplot it ----
  box <- bocks(nr, nc)
  sq <- data.frame(
    col = rep(x, each = 4),
    x = box$x,
    y = box$y
  )

  label_loc <- data.frame(
    col = x,
    x = box$x[seq(1, length(x) * 4, by = 4)] + 0.5,
    y = box$y[seq(1, length(x) * 4, by = 4)] + 0.5
  )
  label_loc$col[is.na(label_loc$col)] <- ''

  # if (requireNamespace('farver', quietly = TRUE)) {
  #   label_loc$color = ifelse(farver::decode_colour(x, to = 'hcl')[, 3] > 50, 'black', 'white')
  # } else {
     label_loc$color = 'black'
  # }
     return(list(sq, label_loc, x_in))

  if (TRUE) {#(requireNamespace('ggplot2', quietly = TRUE)) {
    # if ggplot2 is available, return a ggplot
    ggplot2::ggplot(sq, ggplot2::aes(x = .data$x, y = .data$y)) +
      ggplot2::geom_tile(ggplot2::aes(fill = col)) +
      ggplot2::geom_text(data = label_loc, ggplot2::aes(label = .data$col, color = .data$color)) +
      ggplot2::guides(fill = 'none', color = 'none') +
      ggplot2::scale_fill_manual(values = x_in, na.value = 'white') +
      ggplot2::scale_color_manual(values = c('black' = 'black', 'white' = 'white')) +
      ggplot2::coord_fixed() +
      ggplot2::theme_void()
  } else {
    # otherwise make a base plot
    # Plot tiles
    rect(sq$x, sq$y, col = x_in, xlab = "", ylab = "", asp = 1)

    # Add text
    text(label_loc$x, label_loc$y, labels = label_loc$col, col = label_loc$color)
  }
}
