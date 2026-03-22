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
  x_vals <- vec_data(x)
  x_names <- vec_names(x)
  n <- length(x_vals)

  if (n == 0) {
    if (use_ggplot && requireNamespace('ggplot2', quietly = TRUE)) {
      .data <- ggplot2::.data
      return(
        ggplot2::ggplot(data.frame(x = numeric(), y = numeric()), ggplot2::aes(x = .data$x, y = .data$y)) +
          ggplot2::coord_fixed() +
          ggplot2::theme_void()
      )
    }

    plot(NULL,
      axes = FALSE, xlab = '', ylab = '',
      xlim = c(0, 1), ylim = c(1, 0), asp = 1
    )
    return(invisible(NULL))
  }

  if (all(is.na(x_vals))) {
    cli::cli_abort('{.arg x} must contain at least one non-missing color to plot.')
  }

  x_in <- stats::setNames(stats::na.omit(x_vals), stats::na.omit(x_vals))

  # convert to square-able
  nc <- ceiling(sqrt(n))
  nr <- ceiling(n / nc)
  x_pad <- c(x_vals, rep(NA_character_, (nr * nc) - n))
  if (is.null(x_names)) {
    x_names_pad <- NULL
  } else {
    x_names_pad <- c(x_names, rep(NA_character_, length(x_pad) - n))
  }

  # ggplot it ----
  box <- bocks(nr, nc)
  sq <- data.frame(
    col = rep(x_pad, each = 4),
    x = box$x,
    y = -box$y
  )


  if (use_names && !is.null(x_names_pad)) {
    labs <- paste0(x_names_pad, '\n', x_pad)
  } else {
    labs <- x_pad
  }

  label_loc <- data.frame(
    col = labs,
    x = box$x[seq(1, length(x_pad) * 4, by = 4)] + 0.5,
    y = -(box$y[seq(1, length(x_pad) * 4, by = 4)] + 0.5)
  )
  if (nrow(label_loc) > n) {
    label_loc$col[(n + 1):nrow(label_loc)] <- ''
  }

  label_loc$color <- 'white'
  non_missing <- !is.na(x_pad)
  label_loc$color[non_missing] <- ifelse(hex_to_luminosity(x_pad[non_missing]) > 0.5, 'black', 'white')
  label_loc$color[!non_missing] <- NA_character_

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
    tile_idx <- which(!is.na(x_pad))
    label_loc <- label_loc[seq_len(n), ]

    # Plot tiles
    plot(NULL,
      axes = FALSE, xlab = '', ylab = '',
      xlim = c(0, nc), ylim = c(nr, 0), asp = 1
    )
    graphics::rect(
      xleft = box$x[(tile_idx * 4) - 3],
      xright = box$x[(tile_idx * 4) - 2],
      ybottom = box$y[tile_idx * 4],
      ytop = box$y[(tile_idx * 4) - 3],
      col = x_pad[tile_idx]
    )

    # Add text
    graphics::text(label_loc$x, -label_loc$y,
      labels = label_loc$col, col = label_loc$color
    )
  }
}
