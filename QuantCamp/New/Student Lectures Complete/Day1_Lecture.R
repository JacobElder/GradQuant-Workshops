### Installing packages

install.packages("pacman")

### Can you install tidyverse?

install.packages("tidyverse")

### Loading packages

library(pacman)

### Can you load tidyverse?

library(tidyverse)

### Pacman package allows you to load multiple packages at once

install.packages("Rmisc")

p_load(tidyverse,
       Rmisc
)

### Pacman also allows you to unload multiple packages at once

p_unload(tidyverse,
         Rmisc
         )

### Help for functions

?cor

### Can you ask for help for using linear regression (Hint: The linear regression function is lm() )

?lm

### What is working directory?

getwd()

### How to change working directory?

setwd("~")