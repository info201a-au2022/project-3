library(shiny)
library(ggplot2)
library(leaflet)
library(tidyverse)
library(maps)
library(readr)
library(plotly)

source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = ui, server = server)
