library(shiny)
library(ggplot2)
library(leaflet)
library(tidyverse)
library(maps)
library(readr)
library(plotly)
#library("rsconnect")

source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = ui, server = server)

#setAccountInfo(name='karinaa', token='B626E7E2578D2BC98ED2B0BD3933D921', secret='cPFCMcixb1H38uTLQLQKapKaqKL6qDamo5O60dyN')

#deployApp('/Users/karin/info201/project2/project-group-4-section-ab/Shiny_Project')