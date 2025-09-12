# palette 0.0.3

* Adds `lighten()` and `darkness()` generic functions to lighten or darken colors.
* Corrects R dependency to R (>= 4.1.0).

# palette 0.0.2

* Minor documentation fixes for CRAN resubmission.

# palette 0.0.1

* Initial CRAN submission.
* Implements `palette` class with support for:
  - `palette` vectors can be plotted using `plot()`.
  - `palette` vectors have pretty printing in the console.
  - `palette` vectors in `tibble`s have `pillar` methods for color display.
* Adds a `palette_function()` generator to use `palette`s within `ggplot2` discrete scales.
* Implements testing with `testthat` and `vdiffr`.
