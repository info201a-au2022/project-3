#libraries
library(shiny)
library(ggplot2)
library(leaflet)
library(tidyverse)
library(maps)
library(readr)
library(plotly)

#source files
source("../source/Children ART.R")

#CSV files
estimates <- read.csv("../data/art_pediatric_coverage_by_country_clean.csv", stringsAsFactors = FALSE)
HIV_AIDS_dataset <- read.csv("../data/no_of_people_living_with_hiv_by_country_clean.csv")
deaths_dataset <- read.csv("../data/no_of_deaths_by_country_clean.csv")
prevention_mother_to_child <- read.csv("../data/prevention_mother_to_child.csv")

server <- function(input, output) {
  
#-------------------------------------------------------------------------------------------------------
 #Karina's plot   
  output$selectCountry <- renderUI({
    selectInput("Country", "Select Country", choices = unique(children_art$Country))
  })               
  output$CountryPlot <- renderPlotly({
    art_plot <- children_art %>% 
      filter(Country %in% input$Country)
    children_art_plot <- ggplot(data = art_plot) +
      geom_col(mapping = aes(x = Country,y = Count, fill = Type), position = "dodge") +
      scale_fill_manual(values = c("#6D2E46", "#EC7505")) +
      labs(title = "Children Receiving ART vs. Children Needing ART") +
      scale_y_continuous(labels = scales::comma)
    return(children_art_plot)
  })
#-------------------------------------------------------------------------------------------------------  
### Caprices code for the graph

no_of_hiv_aids_cases <- data.frame(HIV_AIDS_dataset$Country, HIV_AIDS_dataset$Count_median) %>%
  group_by(HIV_AIDS_dataset.Country) %>%
  summarise(Median_HIV_ADIS_cases = sum(HIV_AIDS_dataset.Count_median)) %>%
  rename("Country" = "HIV_AIDS_dataset.Country",
         "Median Number of HIV/AIDS Cases" = "Median_HIV_ADIS_cases")

no_of_deaths <- data.frame(deaths_dataset$Country, deaths_dataset$Count_median) %>%
  group_by(deaths_dataset.Country) %>%
  summarise(Median_deaths = sum(deaths_dataset.Count_median)) %>%
  rename("Country" = "deaths_dataset.Country",
         "Median Number of Deaths" = "Median_deaths")

combined_one <- left_join(no_of_hiv_aids_cases, no_of_deaths)

deaths_and_cases <-  combined_one %>%
  filter() %>%
  ggplot( aes(x = `Median Number of HIV/AIDS Cases`, y = `Median Number of Deaths`, color = Country)) +
  xlab("HIV/AIDS Median Cases") +
  ylab("Median Number of Deaths") +
  geom_point () +
  theme_bw()

#----------------------------------------------------------------------------------------------------------
# Olivia's code for the map
library(maps)
library(readr)
library(leaflet)
library(dplyr)
us_map_data <- prevention_mother_to_child %>%
  select(Country, Percentage.Recieved_median) %>%
  group_by(Country) %>%
  na.omit()

data(world.cities)

df <- world.cities %>%
  filter(capital == 1) %>%
  select(Country = country.etc, lat, lng = long) %>%
  left_join(us_map_data, by = "Country") %>%
  na.omit()

percent_received <- leaflet(df)%>%
  addTiles()%>%
  addMarkers(label = ~Percentage.Recieved_median) 
}
