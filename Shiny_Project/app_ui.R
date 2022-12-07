library(shiny)
-----------------------------------------------------------------------------------------
### Karinas Page
  
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
### Caprices UI

interactive_page2 <- tabPanel(
  "HIV/AIDS & Deaths",
    titlePanel("Number of People Living With HIV/AIDS vs Number of Deaths Due to HIV/AIDS"),
    mainPanel(
      ggplotly(deaths_and_cases)) , 
    mainPanel(
      br(),
      br(),
      p("This chart shows the number of people living with HIV/AIDS vs number of deaths due to HIV/AIDS. The purpose of this chart is to show the correlation between these two variables, and to show mainly how dangerous HIV/AIDS is." )),
    br(),
    br(),
    br(),
    mainPanel(
      br(),
      br(),
      p(p("You can see a mainly positive growth and correlation between deaths and number of cases, and although this is a correlation it does represent something super important as the disease is deadly. For example the 12 year survival rate is only about 19% respectively. Drawing attention towards this deadly disease and bringing public health initiatives is huge, also because the main countries that are impacted by it are in the global south."))
    )
  )
  
-----------------------------------------------------------------------------------------
ui <- navbarPage("HIV/AIDS Cases & Preventative Measures Among the Living and the Not",
                 theme = shinythemes::shinytheme("cosmo"),
                 interactive_page2,
                 interactive_page3,
)
