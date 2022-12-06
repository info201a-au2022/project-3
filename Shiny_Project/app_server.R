#source files
source("../source/Children ART.R")
#CSV files
estimates <- read.csv("../data/art_pediatric_coverage_by_country_clean.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
-------------------------------------------------------------------------------------------------------
 #Karina's plot   
  output$selectCountry <- renderUI({
    selectInput("Country", "Select Country", choices = unique(estimates$Country))
  })               

  children_art_plot <- reactive({
    art_plot <- children_art %>% 
      filter(Country %in% input$Country)
    
    ggplot(data = art_plot) +
      geom_col(mapping = aes(x = Country,y = Count, fill = Type), position = "dodge") +
      scale_fill_manual(values = c("#6D2E46", "#EC7505")) +
      labs(title = "Children Receiving ART vs. Children Needing ART") +
      scale_y_continuous(labels = scales::comma) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
  })
  output$CountryPlot <- renderPlot({
    children_art_plot()
  })
} 
-------------------------------------------------------------------------------------------------------  
  

 
  


