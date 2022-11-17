library(tidyverse)
library(kableExtra)

hiv1 <-read.csv("../data/no_of_deaths_by_country_clean.csv", header = TRUE)

hiv2 <- read.csv("../data/HIV_AIDS_dataset.csv", header = TRUE)

hiv3 <- read.csv("../data/prevention_mother_to_child.csv", header = TRUE)

table1 <- hiv2 %>% 
  drop_na() %>% 
  group_by(Country) %>% 
  summarise(Count_max = sum(Count_max), Count_median = sum(Count_median))

library(dplyr)
library(stringr)
library(tidyverse)

