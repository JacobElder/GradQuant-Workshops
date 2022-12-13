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

p1 <- ggplot(df, aes(x=fairelcc)) + geom_histogram() + theme_minimal()
p1

p2 <- ggplot(df, aes(x=medcrgv, color=gndr, group=gndr)) + geom_histogram(alpha=.1, position="dodge") + theme_classic()
p2

p3 <- ggplot(df, aes(x=gvctzpv, color=gndr, group=gndr)) +
  geom_histogram(aes(y = ..density..),  fill = "white", alpha=.2) +
  geom_density() + theme_void()
p3

#####################

# Color Palettes

#####################

# Defaults

p4 <- df %>%
  ggplot() +
  aes(x = fairelcc, y = medcrgv, shape = gndr, color=cntry) +
  geom_jitter(alpha = .5) +
  geom_smooth(method=lm)

# different palette

p4 + scale_colour_brewer(palette = 1)

p4 + scale_colour_brewer(palette = 10)

# install RColorBrewer

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all(colorblindFriendly = TRUE)  

p4 + scale_color_brewer(palette = "PuOr")
p4 + scale_color_brewer(palette = "YlOrRd")
p4 + scale_color_brewer(palette = "YlOrRd", direction = -1) # flip order

# scale_color_brewer applies to color but can also use scale_fill_brewer() for fill of barplots as well

# find colors you like: https://colorbrewer2.org/#type=sequential&scheme=PuBuGn&n=9

# Can also change colors manually with scale_fill_manual()

# install and load wedanderson

library(wesanderson)
pal <- wes_palette("FantasticFox1", 10, type = "continuous")

p4 + scale_color_discrete(labels = c("A","B","C","D","E","F","G","H","I","J"), name = "Countries"
                          )  + 
  labs(x="Fair Election", y = "Media Criticial", 
                                    title = "Association Between Free Press\n and Free Election") +
  scale_shape_discrete(name = "Gender", labels = c("Male","Female")) + 
  scale_color_manual(values = pal)

install.packages("devtools")
devtools::install_github("katiejolly/nationalparkcolors")
library(nationalparkcolors)

numcountries <- 10
pal <- colorRampPalette(park_palette("DeathValley", 5))(numcountries)
pal

p4 + scale_color_discrete(labels = c("A","B","C","D","E","F","G","H","I","J"), name = "Countries"
)  + 
  labs(x="Fair Election", y = "Media Criticial", 
       title = "Association Between Free Press\n and Free Election") +
  scale_shape_discrete(name = "Gender", labels = c("Male","Female")) + 
  scale_color_manual(values = pal)

#####################

# Grids and Panels

#####################

# ggarrange using ggpubr package

# You can customize the arrangement of plots

library(ggpubr)

ggarrange(ncol=3,nrow=1, p1,p2,p3)

ggarrange(ncol=3,nrow=1, p1,p2,p3, common.legend = T)

p4 <- qplot(fairelcc, data = df)

# facet wrap

# Different panel for each gender

p5 <-
  p4 + facet_wrap( ~ gndr, nrow = 1) + theme(legend.position = "none") +
  ggtitle("facetted plot")


#####################

# Line plots for timeseries

#####################

set.seed(500)
#create dataset with time series
ts <- data.frame(date = as.Date("2022-07-12") - 0:99, # 100 dates up to 2021-01-01
                 sales = runif(100, 0, 1000) + rnorm(100,0,2000) + seq(50,149)^2)

#view first six rows
head(ts)

#create time series plot
p <- ggplot(ts, aes(x=date, y=sales)) +
  geom_line() + theme_linedraw()

#display time series plot
p
