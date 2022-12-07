#interactive graph code
library(readr)
library("leaflet")
library(maps)

prevention_mother_to_child <- read.csv('prevention_mother_to_child.csv')
us_map_data <- prevention_mother_to_child %>%
  select(Country, Percentage.Recieved_max) %>%
  group_by(Country) %>%
  na.omit()




data(world.cities)

df <- world.cities %>%
  filter(capital == 1) %>%
  select(Country = country.etc, lat, lng = long) %>%
  left_join(us_map_data, by = "Country") %>%
  na.omit()

# now map the result
leaflet(df)%>%
  addTiles()%>%
  addMarkers(label = ~Percentage.Recieved_max) 


