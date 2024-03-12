#' Build a palette function
#'
#' Creates a palette function for use within `ggplot2` as an argument to `discrete_scale`.
#' If the number of colors requested is greater than the length of the palette,
#' the palette will be repeated. If the number of colors requested is less than the
#' length of the palette, the palette will be truncated. This is done explicitly, as
#' `vctrs` recycling purposefully does not recycle to partial lengths, like a vector of
#' size 10 to a vector of size 3 or 13.
#'
#' @param x a palette
#'
#' @return a function which takes an integer `n` and returns a vector of `n` colors
#' @export
#'
#' @examples
#' palette_function(palette(roygbiv))(10)
palette_function <- function(x) {

  #if (type == 'discrete') {
    pal <- unname(x)
    function(n) {
      if (n <= length(pal)) {
        pal[seq_len(n)]
      } else {
        rep(pal, ceiling(n / length(pal)))[seq_len(n)]
      }
    }
  # } else if (type %in% c('continuous', 'binned')) {
  #
  # } else {
  #   cli::cli_abort('{.arg type} must be one of {.val discrete}, "{.val continuous}, or {.val binned}.')
  # }
}
