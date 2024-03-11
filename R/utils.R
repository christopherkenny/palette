bocks <- function(r, c) {
  seqr <- seq_len(r) - 1L
  seqc <- seq_len(c) - 1L

  list(
    x = rep(vapply(seqc, \(row) row + c(0, 1, 1, 0), FUN.VALUE = numeric(4)), r),
    y = c(vapply(seqr, \(col) rep(col + c(0, 0, 1, 1), times = c), FUN.VALUE = numeric(4 * c)))
  )
}

hex_to_luminosity <- function(hex) {
  apply(grDevices::col2rgb(hex) / 256, 2, function(y) sum(c(0.2126, 0.7152, 0.0722) * y))
}