library(shiny)
-----------------------------------------------------------------------------------------
interactive_page3 <- tabPanel(
  "Antiretroviral in Children",
  titlePanel("Antiretroviral Distribution Among Children"),
sidebarLayout(
sidebarPanel(
      uiOutput("selectCountry")
),
mainPanel(
plotOutput("CountryPlot")
    )
  )
)
-----------------------------------------------------------------------------------------
ui <- navbarPage("HIV/AIDS Cases & Preventative Measures Among the Living and the Not",
                 theme = shinythemes::shinytheme("cosmo"),
                 interactive_page3
)
