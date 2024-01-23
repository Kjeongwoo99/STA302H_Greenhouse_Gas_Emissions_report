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


### Read in the Data ###
ghg_emissions_data<- read_csv(file = "/cloud/project/inputs/data/ghg-emissions.csv", show_col_types = FALSE)

### Cleaning the dataset ###
ghg_emissions_data_clean <- ghg_emissions_data %>%
  rename_all(tolower) %>%
  gather(key = "year", value = "emissions", `1990`:`2020`) %>%
  mutate(year = as.integer(year),
         emissions = as.numeric(emissions))

#### Save data ####
write_csv(
  x = ghg_emissions_data_clean, 
  file = "ghg_emissions_data_clean.csv"
) 

# filter the data by only selecting the year 2020
emissions_2020 <- ghg_emissions_data_clean %>% filter(year == 2020)

# Arrange in descending order and select top 10 countries
sorted_data <- emissions_2020 %>%
  arrange(desc(emissions)) %>%
  slice(1:10)

# Selecting the top ten countries that emit the most GHG emissions per year. This is because about 60% of total emissions come from 10 countries. 
top_countries <- ghg_emissions_data_clean %>%
  filter(year == 2020) %>%
  arrange(desc(emissions)) %>%
  head(10) %>%
  pull(iso)
