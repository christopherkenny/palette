bocks <- function(r, c) {
  seqr <- seq_len(r) - 1L
  seqc <- seq_len(c) - 1L

  list(
    x = rep(vapply(seqc, \(row) row + c(0, 1, 1, 0), FUN.VALUE = numeric(4)), r),
    y = c(vapply(seqr, \(col) rep(col + c(0, 0, 1, 1), times = c), FUN.VALUE = numeric(4 * c)))
  )
}

# poorman's left pad string x to length len
# beware: x needs to be length 1 but this isn't checked
lpad <- function(x, len) {
  paste0(paste0(rep(' ', each = len - cli::ansi_nchar(x)), collapse = ''), x)
}

hex_to_luminosity <- function(hex) {
  apply(grDevices::col2rgb(hex) / 256, 2, function(y) sum(c(0.2126, 0.7152, 0.0722) * y))
}

hex_from_name <- function(x) {
  i <- which(x %in% names(named_hexcodes))

  if (length(i) == 0) {
    return(x)
  }

  x[i] <- named_hexcodes[x[i]]
  x
}

convert_colors <- function(x, from = 'sRGB', to ='HSL') {
  if (from == 'sRGB' && to == 'HSL') {
    if (is.matrix(x)) {
      if (nrow(x) != 3 && ncol(x) == 3) {
        srgb <- t(x)
      } else if (nrow(x) == 3) {
        srgb <- x
      } else {
        cli::cli_abort('{.arg x} is a matrix but not convertable to an sRGB matrix.')
      }
      if (max(srgb) > 1 & max(srgb) <= 255) {
        srgb <- srgb / 255
      }
    } else {
      srgb <- grDevices::col2rgb(x) / 255
    }

    c_max <- apply(srgb, 2, max)
    c_min <- apply(srgb, 2, min)
    delta <- c_max - c_min
    w_max <- apply(srgb, 2, which.max)
    #w_min <- apply(srgb, 2, which.min)

    l <- (c_max + c_min) / 2
    s <- ifelse(l == 0, 0, delta / (1 - abs(2 * l - 1)))

    h <- vapply(seq_along(x), function(i) {
      if (delta[i] == 0) {
        0
      } else if (w_max[i] == 1) {
        60 * (((srgb[2, i] - srgb[3, i]) / delta[i]) %% 6)
      } else if (w_max[i] == 2) {
        60 * (((srgb[3, i] - srgb[1, i]) / delta[i]) + 2)
      } else {
        60 * (((srgb[1, i] - srgb[2, i]) / delta[i]) + 4)
      }
    }, FUN.VALUE = numeric(1))

    out <- cbind(h, 100 * s, 100 * l) |>
      `colnames<-`(c('h', 's', 'l'))
  } else if (from == 'HSL' && to == 'sRGB') {
    h <- x[, 1]
    s <- x[, 2] / 100
    l <- x[, 3] / 100

    c <- (1 - abs((2 * l) - 1)) * s
    x <- c * (1 - abs(((h / 60) %% 2) - 1))
    m <- l - (c / 2)

    rgb <- matrix(data = 0, nrow = 3, ncol = length(h))
    rgb[1, ] <- ifelse(h <= 60 | h >= 300, c, ifelse(h <= 120 | h >= 240, x, 0))
    rgb[2, ] <- ifelse(h <= 60 | (h >= 180 & h < 240), x, ifelse(h <= 180, c, 0))
    rgb[3, ] <- ifelse(h < 120, 0, ifelse((h >= 180 & h < 300), c, x))

    out <- (t(rgb) + m) * 255
  } else { # nocov start
    cli::cli_abort('Only sRGB <-> HSL conversion is supported')
  } # nocov end

  out
}
