# Extract or replace parts of an object

`pull_out()` is similar to `[`. It acts on vectors, matrices, arrays and
lists to extract or replace parts. It is pleasant to use with the
magrittr (`%>%`) and base (`|>`) operators.

## Value

`pull_out()` will return an object of the same class as the input
object.

## Examples

``` r
good_choice <- letters %>%
  pull_out(c(5, 2, 1, 4))

good_choice
#> [1] "e" "b" "a" "d"

iris %>%
  pull_out(, 1:4) %>%
  head()
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width
#> 1          5.1         3.5          1.4         0.2
#> 2          4.9         3.0          1.4         0.2
#> 3          4.7         3.2          1.3         0.2
#> 4          4.6         3.1          1.5         0.2
#> 5          5.0         3.6          1.4         0.2
#> 6          5.4         3.9          1.7         0.4
```
