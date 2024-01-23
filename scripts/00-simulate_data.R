#### Preamble ####
# Purpose: Simulates the GHG emissions by country data 
# Author: Jeongwoo Kim 
# Date: 23 January 2024
# Contact: jwoo.kim@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
set.seed(100)

countries <- c('China', 'United States', 'India', 'Russia', 'Indonesia',
               'Brazil', 'Japan', 'Iran', 'Canada', 'Saudi Arabia')

simulated_data <- 
  tibble (
    # select 10 most GHG emitting countries 
    "country" = countries,
    # make it to the most recent year: 2020
    "year" = rep(2000, length(countries)),
    # randomly assign each country with GHG emissions ranging from 0 to the maximum of 13000 
    "emissions" = runif(length(countries), min = 0, max = 13000)
  )



