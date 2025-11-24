# Palette Casting

Dispatch methods for
[`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)

## Usage

``` r
# S3 method for class 'palette'
vec_cast(x, to, ...)
```

## Arguments

- x:

  Vectors to cast.

- to:

  Type to cast to. If `NULL`, `x` will be returned as is.

- ...:

  For `vec_cast_common()`, vectors to cast. For `vec_cast()`,
  `vec_cast_default()`, and `vec_restore()`, these dots are only for
  future extensions and should be empty.

## Value

a vector of the same length, as class `palette` if convertible,
otherwise `character`
