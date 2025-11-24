# Changelog

## palette 0.0.3

CRAN release: 2025-09-13

- Adds
  [`lighten()`](http://christophertkenny.com/palette/reference/brightness.md)
  and `darkness()` generic functions to lighten or darken colors.
- Corrects R dependency to R (\>= 4.1.0).

## palette 0.0.2

CRAN release: 2024-03-15

- Minor documentation fixes for CRAN resubmission.

## palette 0.0.1

- Initial CRAN submission.
- Implements `palette` class with support for:
  - `palette` vectors can be plotted using
    [`plot()`](https://rdrr.io/r/graphics/plot.default.html).
  - `palette` vectors have pretty printing in the console.
  - `palette` vectors in `tibble`s have `pillar` methods for color
    display.
- Adds a
  [`palette_function()`](http://christophertkenny.com/palette/reference/palette_function.md)
  generator to use `palette`s within `ggplot2` discrete scales.
- Implements testing with `testthat` and `vdiffr`.
