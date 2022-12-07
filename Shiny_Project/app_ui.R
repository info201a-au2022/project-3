library(shiny)
library(leaflet)
#-----------------------------------------------------------------------------------------
## INTRO
  
 Intro <- tabPanel(
    "Introduction",
    h1(strong("HIV/AIDS Cases & Preventative Measures Among the Living and the Not")),
    h6("Group AB-4: Caprice Culkin, Nahom Mehari, Olivia Cooper, and Karina Amaya"),
    p("     To begin this project was used to collect different data on the number of people living with HIV/AIDS vs the number of deaths caused from the disease. To summarize, this project was created with the intention of showing visualization that analyze the difference between the population of people living with the disease, compared to those who are dead due to the disease."),
    p("     The problem domain of this project is to analyze the number of HIV cases and deaths, based on the ratio or percentage of which that population in each respective state is affected."),
    p("     The research questions used for this project were the following: First, what are ways to gather information on the correlation between HIV cases, coverage and maternal transmission with minimal bias? Secondly, how can information gathered help us understand the relationship of public health in ways as how it differentiates between countries. The final question asked how can data shown from stakeholders, which in this case are those who test positive help us understand potential benefits or harms from treatment imposed such as ART (Anti-Viral Therapy)."),
    p("     The data analyzed within this project was plentiful as we used a Map and Scatterplot which each respectively can be used to determine the differences between each states cases and to analyze the data of the deaths and living cases against each other as well."),
    p("     The key findings throughout this project was the number of cases to deaths of a certain states population .We can show that through our visualizations by selecting whichever state we are interested in, within our scatterplot frame which then will return points on the graph which explain the ratio of number of deaths or people living with HIV as you decide to choose.")
  )

#------------------------------------------------------------------------------------------ 
  
  ### Karinas Page
  
interactive_page1 <- tabPanel(
  "Antiretroviral in Children",
  titlePanel("Antiretroviral Distribution Among Children"),
sidebarLayout(
sidebarPanel(
      uiOutput("selectCountry")
),
mainPanel(
plotlyOutput(outputId = "CountryPlot"),
mainPanel(
  p("     The bar chart compares the amount of children who need antiretrovirals and those who are receiving antiretrovirals (estimated). The chart allows for a country distribution to be shown. Some countries lack the children who need ART bar or the children receiving ART. This is due to the lack of data given, some countries did not report those numbers, but it is still important to take into account the data that is shown."),
  p("     For most if not all countries, we can see the comparison of children who need ART and those who are receiving ART, and it shows the disparity between the two variables. This could be due to the fact that many people with HIV/AIDS around the world don’t have access to healthcare or don’t have the resources to afford healthcare. Other barriers can include cultural or religious factors. As well as discrimination people may face. It is important that children have access to ART and it is also important to bring more awareness to this issue that people are facing.")

    )
  )
))
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
#------------------------------------------------------------------------------------------
## Olivia's UI

interactive_page3 <- tabPanel(
  "Percentage of Antiretrovirals Received Map",
  titlePanel("Percentage of Antiretrovirals Received by Country"),
  mainPanel(
    leafletOutput(percent_received)
  )
)

#-----------------------------------------------------------------------------------------
summary <- tabPanel(
  "Summary Takeaways",
  h3("First Takeaway"),
  p("One main takeaway relating to our question, is that pediatric coverage is needed because of how deadly the virus is. This is shown in the deaths caused by HIV tab, and shows how the increase in HIV cases also results in an increase in deaths. This is something that is very prevalent because of its low survival rate and overall impact on public health, mainly in global south countries. As you can see by hovering over the chart on that page, the top countries with higher deaths are; South Africa, Kenya, Nigeria, Zimbabwe, and Uganda. These countries all have lesser public health initiatives which is why it is important to implement more mother to child preventative care."),
h3("Second Takeaway"),
p("A second takeaway from this is relating to the collection of this data and how it can help others understand the relationship between health initiatives and different countries. From the map, it was clear that there are a significant number of countries that did not receive anywhere close to how many antiretrovirals that they needed. A large majority of these countries are in places like Africa and the Middle East while many countries across South America received close to 100% of their needed antiretrovirals. This shows that countries with higher need are not necessarily receiving equitable amounts of antiretrovirals compared to other countries."),
h3("Third Takeaway"),
p("From the bar chart we can see how people and more importantly, children are in need of antiretrovirals. It is important to note that this is not just occurring in one place in the world, but all around the world. This discrepancy has occurred because of many factors. With many of these factors relating to class, gender,  race, identity,  religion, and sexual orientation. The main one being that many people around the world do not have access to healthcare. It is important to make ART accessible for people around the world, especially children. Especially for children who have no parents or guardians, there isn’t much they can do because they are only children")
  )


#-----------------------------------------------------------------------------------------
report_page <- tabPanel(
  "Report"

)

#------------------------------------------------------------------------------------------
ui <- navbarPage("HIV/AIDS Cases & Preventative Measures Among the Living and the Not",
                 theme = shinythemes::shinytheme("cyborg"),
                 Intro,
                 interactive_page1,
                 interactive_page2,
                 interactive_page3,
                 summary,
                 report_page
)
