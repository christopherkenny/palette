# Palette Coercion

Coercion methods for
[`vctrs::vec_ptype2()`](https://vctrs.r-lib.org/reference/vec_ptype2.html)

## Usage

``` r
# S3 method for class 'palette'
vec_ptype2(x, y, ...)
```

## Arguments

- x, y:

  Vector types.

- ...:

  These dots are for future extensions and must be empty.

## Value

a vector of the same length, as class `palette` if convertible,
otherwise `character`
