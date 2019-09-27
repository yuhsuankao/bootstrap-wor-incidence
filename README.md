one parameter bootstrap - sampling without replacement for incidence
data
================

build\_bootstrap\_population(y, T\_star)

To estimate the bootstrap population of an incidence sample which was
drawn without replacement.

  - y: a vector of incidence-based sample frequencies (1st entry must be
    the number of sampling unit, T).

  - T\_star: The total sampling units in the population.

  - return: a vector consisting of Mi, the number of sampling units in
    which species i can be detectd in the bootstrap population (1st
    entry is T\_star).

EXAMPLES ——–
assuming T_star = 100

``` r
library(magrittr)
load("bird.rda")
bird_north = c(ncol(bird$inci$North.site), bird$inci$North.site %>% rowSums %>% as.vector)
build_bootstrap_population(bird_north, 100)
```

    ##  [1] 100 100  14   4  42   4  14  75   4   4  42  42   4  50  42   4   4
    ## [18]  59  59   4   4  24  14  84  24  14  24  42   8   8   8   8   8   8
    ## [35]   8   8   8
