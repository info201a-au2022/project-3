library(shiny)
#-----------------------------------------------------------------------------------------
## INTRO
  
 Intro <- tabPanel(
    "Intro", 
    p("To begin this project was used to collect different data on the number of people living with HIV/AIDS vs the number of deaths caused from the disease.To summarize, this project was created with the intention of showing visualization that analyze the difference between the population of people living with the disease, compared to those who are dead due to the disease."),
    p("The problem domain of this project is to analyze the number of HIV cases and deaths, based on the ratio or percentage of which that population in each respective state is affected."),
    p("The research questions used for this project were the following: First, what are ways to gather information on the correlation between HIV cases, coverage and maternal transmission with minimal bias? Secondly, how can information gathered help us understand the relationship of public health in ways as how it differentiates between countries. The final question asked how can data shown from stakeholders, which in this case are those who test positive help us understand potential benefits or harms from treatment imposed such as ART (Anti-Viral Therapy)"),
    p("The data analyzed within this project was plentiful as we used a Map and Scatterplot which each respectively can be used to determine the differences between each states cases and to analyze the data of the deaths and living cases against each other as well."),
    p("The key findings throughout this project was the number of cases to deaths of a certain states population .We can show that through our visualizations by selecting whichever state we are interested in, within our scatterplot frame which then will return points on the graph which explain the ratio of number of deaths or people living with HIV as you decide to choose.")
  )

#------------------------------------------------------------------------------------------ 
  
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
#-----------------------------------------------------------------------------------------
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
  
#-----------------------------------------------------------------------------------------
ui <- navbarPage("HIV/AIDS Cases & Preventative Measures Among the Living and the Not",
                 theme = shinythemes::shinytheme("cosmo"),
                 Intro,
                 interactive_page2,
                 interactive_page3,
)
