# Build a palette function

Creates a palette function for use within `ggplot2` as an argument to
`discrete_scale`. If the number of colors requested is greater than the
length of the palette, the palette will be repeated. If the number of
colors requested is less than the length of the palette, the palette
will be truncated. This is done explicitly, as `vctrs` recycling
purposefully does not recycle to partial lengths, like a vector of size
10 to a vector of size 3 or 13.

## Usage

``` r
palette_function(x)
```

## Arguments

- x:

  a palette

## Value

a function which takes an integer `n` and returns a vector of `n` colors

## Examples

``` r
palette_function(palette(roygbiv))(10)
#> <palette[10]>
#>  [1]  #FF4444   #FFAE4D   #FFFF60   #50FF50   #3939FA   #AB3FFB  
#>  [2]  #F68BF6   #FF4444   #FFAE4D   #FFFF60  
```
