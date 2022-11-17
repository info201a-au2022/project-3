library(tidyverse)


art_pediatric_coverage <- read.csv("art_pediatric_coverage_by_country_clean.csv", stringsAsFactors = FALSE)
View(art_pediatric_coverage)

cases_adults_age <- read.csv("no_of_cases_adults_15_to_49_by_country_clean (2).csv", stringsAsFactors = FALSE)
View(cases_adults_age)

deaths_by_country <- read.csv("no_of_deaths_by_country_clean.csv", stringsAsFactors = FALSE)
View(deaths_by_country)

people_living_wHIV <- read.csv("no_of_people_living_with_hiv_by_country_clean (3).csv", stringsAsFactors = FALSE)
View(people_living_wHIV)

mother_to_child <- read.csv("prevention_of_mother_to_child_transmission_by_country_clean (2).csv", stringsAsFactors = FALSE)
View(mother_to_child)

#5 values will be focusing on the data sets of number of people living with HIV/AIDS,
#number of deaths due to HIV/AIDS, number of cases among adults (19-45), 
#prevention of mother-to-child transmission estimates, and ART coverage among children estimates.

#ratio of children who need ART and those who receive
children_needing_ART <- select(art_pediatric_coverage, Estimated.number.of.children.needing.ART.based.on.WHO.methods_median) %>% 
  summarize(needing_summarized = mean(Estimated.number.of.children.needing.ART.based.on.WHO.methods_median, na.rm = TRUE))
children_needing_ART

children_receiving_ART <- select(art_pediatric_coverage, Estimated.ART.coverage.among.children...._median) %>% 
  summarize(receiving_summarized = mean(Estimated.ART.coverage.among.children...._median, na.rm = TRUE))
children_receiving_ART

ratio_between_needing_receiving <- children_needing_ART / children_receiving_ART
ratio_between_needing_receiving

#average of cases in adults (ages 15-49)
cases_adults_age_summarize <- select(cases_adults_age, Count_median) %>%
  summarize(summarized_cases = mean(Count_median, na.rm = TRUE))  
cases_adults_age_summarize
#average for deaths
deaths_by_country_summarize <- select(deaths_by_country, Count_median) %>% 
  summarize(deaths_summarized = mean(Count_median, na.rm = TRUE))
deaths_by_country_summarize
#ratio between cases and deaths 
ratio_between_cases_deaths <- deaths_by_country_summarize / cases_adults_age_summarize
ratio_between_cases_deaths
#average of people living with HIV
people_living_wHIV_summary <- select(people_living_wHIV, Count_median) %>% 
  summarize(wHIV_average = mean(Count_median, na.rm = TRUE))
people_living_wHIV_summary

#ratio of mothers receiving and needing ART

mothers_needing <- select(mother_to_child, Needing.antiretrovirals_median) %>%
  summarize(mothers_needing_summary = mean(Needing.antiretrovirals_median, na.rm = TRUE))
mothers_needing

mothers_receiving <- select(mother_to_child, Percentage.Recieved_median) %>% 
  summarize(mothers_receiving_summary = mean(Percentage.Recieved_median, na.rm = TRUE))
mothers_receiving

ratio_of_needing_receiving <- mothers_needing / mothers_receiving
ratio_of_needing_receiving

summary_info <- list(ratio_between_needing_receiving, cases_adults_age_summarize,
                     deaths_by_country_summarize, people_living_wHIV_summary,
                     ratio_of_needing_receiving)
summary_info