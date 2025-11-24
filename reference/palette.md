# Create a palette

A `palette` is a class for color palettes built on `vctrs`. It is
represented as a character vector of hexadecimal color codes. Named
colors (like `'red'`) are translated to hexadecimal color codes.

## Usage

``` r
palette(x = character())

validate_palette(x)

is_palette(x)

as_palette(x)
```

## Arguments

- x:

  A character vector of colors

## Value

a palette vector

## Examples

``` r
palette(roygbiv)
#> <palette[7]>
#>  [1]  #FF4444   #FFAE4D   #FFFF60   #50FF50   #3939FA   #AB3FFB  
#>  [2]  #F68BF6  
```
