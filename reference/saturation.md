# Control palette saturation

Generic function to control the saturation of a palette.

## Usage

``` r
saturate(x, amount = 0.1, ...)

# Default S3 method
saturate(x, amount = 0.1, ...)

# S3 method for class 'palette'
saturate(x, amount = 0.1, ...)

desaturate(x, amount = 0.1, ...)

# Default S3 method
desaturate(x, amount = 0.1, ...)

# S3 method for class 'palette'
desaturate(x, amount = 0.1, ...)
```

## Arguments

- x:

  A vector of colors

- amount:

  A numeric value to control the saturation of the palette

- ...:

  Additional arguments passed to other methods. Currently ignored.

## Value

A palette vector with the saturation adjusted

## Examples

``` r
saturate(palette(roygbiv))
#> <palette[7]>
#>  [1]  #FF4343   #FFAD4C   #FFFF60   #50FF50   #3333FF   #AB3BFF  
#>  [2]  #FB85FB  
desaturate(palette(roygbiv))
#> <palette[7]>
#>  [1]  #F54D4D   #F6AD55   #F7F767   #58F658   #4242F0   #A948F1  
#>  [2]  #F090F0  
```
