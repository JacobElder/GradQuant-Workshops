library(ggplot2)

setwd("~/Documents/GitHub/UCRQuantCamp/New/Student Lectures Complete/")

# read_csv will interpret the file as a tibble

df <- read_csv("ESS10.csv")

# Set up data for plotting

df <- df %>%
  mutate(fairelcc = replace(fairelcc, fairelcc > 76, NA), # In country national elections are free and fair
         medcrgv = replace(medcrgv, medcrgv > 76, NA), # In country the media are free to criticise the government
         gvctzpv = replace(gvctzpv, gvctzpv > 76, NA), # The government protects all citizens against poverty
         wpestopc = replace(wpestopc, wpestopc > 76, NA) # In country the will of the people cannot be stopped
  ) %>% 
  mutate(gndr = as_factor(ifelse(gndr==9, NA, gndr)) ) 

#####################

# Histograms and Themes

#####################

ggplot(df, aes(x = fairelcc)) + 
  geom_histogram() 

p1 <- ggplot(df, aes(x = fairelcc)) + 
  geom_histogram() +
  theme_minimal()
p1

p2 <- ggplot(df, aes(x = fairelcc, color=gndr)) + 
  geom_histogram(alpha = .1, position="dodge") +
  theme_classic()
p2

# jtools::theme_apa useful potentially

p3 <- ggplot(df, aes(x = fairelcc, color=gndr))  +
  theme_void() + geom_density()
p3

p3 <- ggplot(df, aes(x = fairelcc, color=gndr)) +
geom_histogram(aes(y=..density..), alpha = .1, position="dodge")  +
  theme_void() + 
  geom_density()
p3

#####################

# Color Palettes

#####################

# Defaults

p4 <- df %>%
  ggplot() +
  aes(x = fairelcc, y = medcrgv, shape = gndr, color = cntry) +
  geom_jitter() +
  geom_smooth(method=lm)
p4

# different palette

p4 + scale_colour_brewer(palette = 1)
p4 + scale_colour_brewer(palette = 10) + theme_classic()

# install RColorBrewer

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all(colorblindFriendly = TRUE)

# scale_color_brewer applies to color but can also use scale_fill_brewer() for fill of barplots as well

p4 + scale_color_brewer(palette = "PuOr")
p4 + scale_color_brewer(palette = "YlOrRd")
p4 + scale_color_brewer(palette = "YlOrRd", direction = -1)

# find colors you like: https://colorbrewer2.org/#type=sequential&scheme=PuBuGn&n=9

# Can also change colors manually with scale_fill_manual(values = c("color1", "color2"))

# install and load wedanderson

install.packages("wesanderson")


#####################

# Grids and Panels

#####################

# ggarrange using ggpubr package

# You can customize the arrangement of plots



# facet wrap

# Different panel for each gender



#####################

# Line plots for timeseries

#####################


#create dataset with time series


#view first six rows


#create time series plot


#display time series plot

