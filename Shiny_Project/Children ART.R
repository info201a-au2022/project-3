library(tidyverse)
library(ggplot2)
library(plotly)
library(lintr)

estimates <- read.csv("../data/art_pediatric_coverage_by_country_clean.csv", stringsAsFactors = FALSE)
View(estimates)

#renaming certain columns
estimates <- estimates %>% 
  rename("Reported number of children receiving ART" = "Reported.number.of.children.receiving.ART" )
estimates <- estimates %>% 
  rename("Estimated number of children needing ART" = "Estimated.number.of.children.needing.ART.based.on.WHO.methods_median")
#changing specific country names
estimates["Country"][estimates["Country"] == "Lao People's Democratic Republic"] <- "Laos"
estimates["Country"][estimates["Country"] == "Bolivia (Plurinational State of)"] <- "Bolivia"
estimates["Country"][estimates["Country"] == "Democratic Republic of the Congo"] <- "DR Congo"
estimates["Country"][estimates["Country"] == "Iran (Islamic Republic of)"] <- "Iran"
estimates["Country"][estimates["Country"] == "United Republic of Tanzania"] <- "Tanzania"
#removing space
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "63 900"] <- 63900
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "16 000"] <- 16000
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "12 300"] <- 12300
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "21 500"] <- 21500 
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "45 100"] <- 45100
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "86 900"] <- 86900
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "50 200"] <- 50200
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "67 100"] <- 67100
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "49 100"] <- 49100
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "10 300"] <- 10300
estimates["Reported number of children receiving ART"][estimates["Reported number of children receiving ART"] == "59 600"] <- 59600
#removing certain countries
estimates <- estimates[-c(141), ]
estimates[-c(7, 59, 63, 77, 78, 79, 103, 125, 143), ]
estimates <- subset(estimates, Country != "Spain")
#checking and changing character to numeric 
sapply(estimates, class)
estimates$`Reported number of children receiving ART` = as.numeric(as.character(estimates$`Reported number of children receiving ART`))

#filtering down to specific columns 
children_art <- estimates %>% 
  select(Country,
         `Estimated number of children needing ART`, `Reported number of children receiving ART`) 

children_art <- children_art %>% 
  pivot_longer(!Country, names_to = "Type", values_to = "Count")
#removing NA's
children_art <- na.omit(children_art)
View(children_art)
#plot
children_art_plot <- ggplot(data = children_art) +
  geom_col(mapping = aes(x = Country,y = Count, fill = Type), position = "dodge") +
  scale_fill_manual(values = c("#6D2E46", "#EC7505")) +
  labs(title = "Children Receiving ART vs. Children Needing ART") +
  scale_y_continuous(labels = scales::comma) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

ggplotly(children_art_plot)
