# Control palette brightness

Generic function to control the brightness of a palette.

## Usage

``` r
darken(x, amount = 0.1, ...)

lighten(x, amount = 0.1, ...)

# Default S3 method
darken(x, amount = 0.1, ...)

# S3 method for class 'palette'
darken(x, amount = 0.1, ...)

# Default S3 method
lighten(x, amount = 0.1, ...)

# S3 method for class 'palette'
lighten(x, amount = 0.1, ...)
```

## Arguments

- x:

  A vector of colors

- amount:

  A numeric value to control the brightness of the palette

- ...:

  Additional arguments passed to other methods. Currently ignored.

## Value

A palette vector with the brightness adjusted

## Examples

``` r
darken(palette(roygbiv))
#> <palette[7]>
#>  [1]  #FF5652   #FFC361   #FFFF67   #71FF69   #4B43FF   #BA4EFF  
#>  [2]  #FF9FFF  
lighten(palette(roygbiv))
#> <palette[7]>
#>  [1]  #EC3037   #E79938   #E2E343   #25E535   #212FEE   #9C2FEC  
#>  [2]  #E177E1  
```
