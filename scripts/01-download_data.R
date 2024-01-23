#### Preamble ####
# Purpose: Cleans the ghg_emissions_data by selecting the year 2020 for making table 1, and selecting the top 10 most GHG emitting countries from 1990 to 2020.
# Author: Jeongwoo Kim
# Date: 23 January 2024
# Contact: jwoo.kim@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(readr)
library(ggplot2)

#### Save data ####
ghg_emissions_data<- read_csv(file = "/cloud/project/inputs/data/ghg-emissions.csv", show_col_types = FALSE)

write_csv(
  x = ghg_emissions_data_clean, 
  file = "ghg_emissions_data_clean.csv"
) 
