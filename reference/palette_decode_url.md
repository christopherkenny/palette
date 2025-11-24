# Convert a URL to a palette

This function takes a URL from either \<coolors.co\> or \<colorhunt.co\>
and returns the palette.

## Usage

``` r
palette_decode_url(x)
```

## Arguments

- x:

  A URL from either 'coolors.co' or 'colorhunt.co'

## Value

a vector of type `palette`

## Examples

``` r
palette_decode_url('https://coolors.co/ff4444-ffae4d-ffff60-50ff50-3939fa')
#> <palette[5]>
#>  [1]  #FF4444   #FFAE4D   #FFFF60   #50FF50   #3939FA  
palette_decode_url('https://www.colorhunt.co/palette/b5c0d0ccd3caf5e8ddeed3d9')
#> <palette[4]>
#>  [1]  #B5C0D0   #CCD3CA   #F5E8DD   #EED3D9  
```
