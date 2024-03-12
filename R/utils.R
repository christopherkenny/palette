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
