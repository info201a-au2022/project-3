library(shiny)
library(ggplot2)
library(leaflet)
library(tidyverse)
library(maps)
library(readr)
library(plotly)
#-----------------------------------------------------------------------------------------
## INTRO
  
 Intro <- tabPanel(
    "Introduction",
    h1(strong("HIV/AIDS Cases & Preventative Measures Among the Living and the Not")),
    p(strong("Group AB-4: Caprice Culkin, Nahom Mehari, Olivia Cooper, and Karina Amaya")),
    h4(("To begin this project was used to collect different data on the number of people living with HIV/AIDS vs the number of deaths caused from the disease. To summarize, this project was created with the intention of showing visualization that analyze the difference between the population of people living with the disease, compared to those who are dead due to the disease.")),
    h4(("The problem domain of this project is to analyze the number of HIV cases and deaths, based on the ratio or percentage of which that population in each respective state is affected.")),
    h4((" The research questions used for this project were the following: First, what are ways to gather information on the correlation between HIV cases, coverage and maternal transmission with minimal bias? Secondly, how can information gathered help us understand the relationship of public health in ways as how it differentiates between countries. The final question asked how can data shown from stakeholders, which in this case are those who test positive help us understand potential benefits or harms from treatment imposed such as ART (Anti-Viral Therapy).")),
    h4(("The data analyzed within this project was plentiful as we used a Map and Scatterplot which each respectively can be used to determine the differences between each states cases and to analyze the data of the deaths and living cases against each other as well.")),
    h4(("The key findings throughout this project was the number of cases to deaths of a certain states population .We can show that through our visualizations by selecting whichever state we are interested in, within our scatterplot frame which then will return points on the graph which explain the ratio of number of deaths or people living with HIV as you decide to choose."))
  )

#------------------------------------------------------------------------------------------ 
  
  ### Karinas Page
  
 interactive_page1 <- tabPanel(
   "Antiretroviral Therapy in Children",
   titlePanel("Antiretroviral Therapy Distribution Among Children with HIV"),
   sidebarLayout(
     sidebarPanel(
       uiOutput("selectCountry")
     ),
     mainPanel(
       plotlyOutput(outputId = "CountryPlot"),
       mainPanel(
         p("     The bar chart compares the amount of children with HIV who need antiretroviral therapy and those who are receiving antiretroviral therapy (estimated). The chart allows for a country distribution to be shown. Some countries lack the children who need ART bar or the children receiving ART. This is due to the lack of data given, some countries did not report those numbers, but it is still important to take into account the data that is shown."),
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
  "Antiretrovirals Received Map",
  titlePanel("Percentage of Antiretrovirals Received by Country"),
  mainPanel(
  percent_received),
  mainPanel(
    br(),
    br(),
    p("This map shows the percentage of Antiretrovirals received by country out of how many that country needed. The numbers shown as you hover over a country, represent those percentages of antiretrovirals received by each country. This map shows the disparities between countries in terms of which ones receive acceptable numbers of antiretrovirals in terms of their need. This map also shows the countries that are most affected by the HIV/AIDs epidemic.")),
  mainPanel(
  br(),
  p("Some important trends to note on this map include which individual regions seem to have the lowest percentages consistently. A lot of countries sit around 95% received. However, places across Western Africa and Northern Africa see very low percentages as well as countries in the Middle East such as Pakistan."))
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
  "Report",
  h3("Code Name"),
  p("HIV/AIDS Information"),
  h3("Project Title"),
  p(" HIV/AIDS Cases & Preventative Measures Among the Living and the Not"),
  h3("Authors"),
  p("Olivia Cooper (coopoli@uw.edu), Caprice Culkin (capricec@uw.edu), Karina Amaya (kyb3@uw.edu), Nahom Mehari (nahomm4@uw.edu)"),
  h3("Affiliation"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  h3("Date"),
  p("Autumn 2022"),
  h3("Abstract"),
  p("Our main question is as follows: is there a correlation between the number of HIV/AIDS deaths and cases by country relating to pediatric coverage and prevention of mother to child transmission? This question is important because it brings out whether preventative public health measures by country have an impact on the HIV/AIDS epidemic. To address the question, we will examine datasets and disparities between multiple countries and see if there is a connection in the data given. We will see if there is a correlation between higher number of cases/deaths and lower preventative measures, or not after sorting through the data."),
  h3("Keywords"),
  p("1. HIV/AIDS 2. Public Health 3. Preventative Measures"),
  h3("Introduction"),
  p("This project will examine the relationship between number of HIV/AIDS cases (adults 15-19) by country, number of deaths by country, number of people living with HIV by country, as well as contrasting it to prevention of mother to child transmission by country and pediatric coverage by country. We are looking to see if there is any correlation between these variables and overall see if different countries' public health measures can lead to less deaths/cases of HIV/AIDS. "),
  h3("Problem Domain"),
  p("Through the analysis and collection of data on HIV/AIDS, we can determine correlations of cases that have been affected by the presence of lack of quality pediatric health coverage as well as the transmission of the disease from mother to child. 
Human Values: We take into consideration how the HIV/AIDS epidemic has had such an immense impact on individuals and families around the world and it continues to do so even as data on these diseases continue to emerge. 
Direct and Indirect Stakeholders: The direct stakeholders are people who have gathered and reported data on HIV/AIDS. This also includes individuals who have tested positive and reported the test. Indirect stakeholders are the individuals who created the website with information on it and the users of the website. This may or may not be direct to them because they are the ones who created the website, not the ones impacted by HIV themselves. Another indirect stakeholder is the medical personnel where a part of their job is to perform the HIV/AIDS test, to process the results, and to post them and notify the individual of their diagnosis. 
Potential Benefits and Harms: A possible harm that could be found are the discrepancies among reported data that may be unreliable or invalid. Having data that is wrong or data that has missing data leads to an inaccurate representation of these cases. Another potential harm is having information that is hard to interpret. Without this, those analyzing information may have a harder time avoiding bias to create the data sets. Some benefits involved are  bringing greater awareness to the HIV/AIDS epidemic as it is today in different countries across the world.
Populations included: The populations included in the domain are 170 out of the total 195 countries.
How this data exists: HIV diagnosis data exists because in order to estimate HIV prevalence in countries classified as having generalized epidemics, UNAIDS relies on antenatal clinic data and, to the extent that they are available, data from nationally representative HIV prevalence surveys. In order to estimate HIV prevalence in countries classified with concentrated and low-level epidemics, UNAIDS relies on specialized surveys of high-risk groups. The CDC uses a combination of methods to estimate HIV prevalence in the United States, including back-calculation (Brookmeyer, Ron). 
Preventative measures: The two data sets that focus on this are prevention of mother to child transmission by country and pediatric coverage by country. For pediatric coverage, it was shown in a study that BIPAI training program in Swaziland had good coverage of all health care facilities and HCPs in Swaziland. The training was effective in imparting knowledge and skills to HCPs and in their attitudes toward HIV/AIDS patients (Kamiru, H.N). And for prevention of child transmission, it is shown that “...in view of the enormous effect that this transmission route has on infant HIV-1 infection worldwide (Kourtis, Athena P, et al)”  So, mother-to-child transmission is super important and why we included it in as a data set.
"),
  h3("Research Questions"),
  p("What are ways to gather information on the correlation between cases, coverage, and maternal transmission with minimal bias or inaccuracy?"),
  p("This is important because the information collected on HIV/AIDS in correlation with those above can help with the understanding of the data. It then would be used apply coverage in areas of need, and how to act with them on a case by case basis which would be the motivations of collecting these variables of data"),
  p("How can information gathered on HIV/AIDS cases help us understand the relationship of public health in ways as how it differentiates between countries"),
  p("This is important because the information gathered between the relationships through different countries may be used to implement more effective care in the place of those without it, due to the skew in data in such locations. Motivations for this would be to have all equal and accessible health care to all who need it, not just where they can afford to pay the luxury tax for it"),
  p("How can data shown from stakeholders, which in this case are those who test positive, help us understand potential benefits or harms from treatments imposed such as ART (Anti-Viral Therapy)"),
  p("This is important because the information collected from the stakeholders help identify potential benefits or harm which would be important for the future of the evolution of treatment. The motivation for this data being collected would be to evolve the study and with that help the potential of the ART therapy"),
  p("How can we gain insights on the differences about the correlation of cases, coverages, transmission, preventative measures and how they each affect stakeholders accordingly?"),
  p("This is important because how they affect the stakeholders differently may help us understand the effects each variable has on the subject. Motivations for this would be to understand how each of this differently affect those affected by HIV/AIDS"),
  h3("The Dataset"),
  p("The different data sets allow us to look at different areas relating to HIV/AIDS. First one allows us to visualize the number of people living with HIV/AIDS. The second one is the numbers of deaths due to HIV/AIDS. Third is the number of cases among adults ages 15-49. The fourth one is the number of pregnant women that are living with HIV who have received antiretrovirals. The fifth data set is reporting the ART coverages among people living with HIV. The final data set is reporting the ART coverages among children. The last two data sets are estimates. The first three data sets include country, year, count, median, min, max, and World Health Organization region. The fourth data set includes country, received antiretrovirals, needing antiretrovirals, percentage received, needing antiretrovirals median, needing antiretrovirals min, needing antiretrovirals max, percentage received median, percentage received min, percentage received max, and WHO region. The fifth data set includes country, reported no. of people receiving ART, estimated number of people living with HIV, estimated ART coverage among people living with HIV, estimated no. of people living with HIV median, estimated no. of people living with HIV min, estimated no. of people living with HIV max, estimated ART coverage among people living with HIV median, estimated ART coverage among people living with HIV min, estimated ART coverage among people living with HIV max, and WHO (World Health Organization) region. The final dataset is the same as the fifth one, but it  only focuses on children. These datasets will allow us to further understand and investigate an answer for our question since it focuses on multiple factors relating to HIV/AIDS. Such as cases, children, people receiving treatment, and pregnant women with AIDS. Devakumar K. P. who is a student at NIELIT Calicut, put together the data sets. The collection method for the data is a GitHub page. Sources for data is the World Health Organization. Purpose is unknown but we can assume that it was created for research purposes. For others to have access to HIV/AIDS data that has been summarized. People who are likely to make money from the data are the creators and potential collaborators. The temporal coverage start date is January, 9th, 2000 and the end date is December, 25th, 2018. The datasets are said to be updated annually but it has not been updated in two years. Even though it has not been updated in two years it is still a very credible source. Since the data has been collected from the World Health Organization which is a government agency that is responsible for international public health."),
  h3("Expected Implications"),
  p(" If we come to the conclusion that there is in fact a correlation between numbers of deaths caused by HIV/AIDS along with case count by country relating to pediatric coverage and prevention of mother to child transmission, then technologists will be able to update data on HIV/AIDS. Possibly creating new data to present as well. Hospitals will have to make changes to the care of HIV/AIDS patients. An example could be the type of medication they are receiving. This will also include scientists, who will create or make changes to said medications. Medications will hopefully lead to a decrease in children who are born with HIV/AIDS. In making new discoveries about HIV/AIDS it leads to a world wide change in new measures and changes. Policy makers could create policies towards ending the spread of HIV/AIDS. As long as the population is aware and more cautious, the creation of policies can go a long way to decrease the number."),
  h3("Limitations"),
  p("Some limitations that come with the gathering of this data would be that of inaccurate information collected, this would come from those afraid of disclosing information about their health for the use of data collection. Along with that, another limitation could be missing information which is not too different from the first, but instead of falling into the category of negative, they would be in a group of uncertainty which can be known as data yet to be collected. Third, a big limitation would be working with a lot of data, and this would be a limitation due to either being confusing for those collecting or viewing the data, along with too much information causing an overload of data which would be harder to view or process as well. Lastly, a limitation of the collection of this data could be the difficulty of how to differentiate how each variables affects the subjects differently."),
  h3("Findings"),
  tags$li("Question: What are ways to gather information on the correlation between cases, coverage, and maternal transmission with minimal bias or inaccuracy?"),
  p("Some of the most effective ways to gather information on the correlation between cases, coverage, and maternal transmissions with minimal bias or inaccuracy  is making sure that information taken is not just focused on one area. For example, focusing on one specific community or one specific country will not represent the whole population. Unless that is the only focus but with this data set we can tell that it is focused on the whole world. Some issues that have led to inaccuracy are missing data. It is important to collect and report data for all groups and countries. We can see that in the Antiretroviral Therapy among children dataset, for some countries the reported number of children receiving Antiretroviral Therapy is missing. This goes for all the datasets that lack certain variables."),
  tags$li("How can information gathered on HIV/AIDS cases help us understand the relationship of public health in ways as how it differentiates between countries?"),
  p("The information gathered on HIV/AIDS allows us to think and to visualize how countries differ. This can be in the economic aspect, healthcare, political, socio-cultural, environmental, and others. Public health is affected by all these subjects. The numbers reported show how countries differ from one another. Each one can interlock and cause different effects on public health. For example the access to education and being knowledgeable of HIV/AIDS. This subject is approached differently around the world."),
  tags$li("How can data shown from stakeholders, which in this case are those who test positive, help us understand potential benefits or harms from treatments imposed such as ART (Antiretroviral Therapy)?"),
  p("This is important because the information collected from the stakeholders help identify potential benefits or harm which would be important for the future of the evolution of treatment. The motivation for this data being collected would be to evolve the study and with that help the potential of the ART therapy. Also seeing how subjects respond to different medications and how that can allow for change of medications."),
  tags$li("How can we gain insights on the differences about the correlation of cases, coverages, transmission, preventative measures and how they each affect stakeholders accordingly?"),
  p("This is important because how they affect the stakeholders differently may help us understand the effects each variable has on the subject. Motivations for this would be to understand how each of these differently affect those affected by HIV/AIDS. With the data sets we can note that there are differences but also similarities. For example the mother to child transmission data set and the ART distribution data set are both focused on different groups of people. But they both have similar variables that are measured. That is, ART. In the mother to child transmission there is a section for the reported number of mothers who are receiving ART and those who are needing it. Similar for the children data set. There are numbers reported on numbers needing ART and those who are receiving ART. The dataset allows us to see which communities are more in need than others."),
  h3("Well to begin, we chose to do our project about the data that encompasses the number of people living with HIV by country, the number of deaths by country, and coverage usage of ART which can be known as Anti-Retro Viral Therapy. We found and used the datasets from Kaggle which allowed us to use different datasets that were similar to each other in terms of the subject as the three datasets we used were for the number of people living with HIV/AIDS, the number of deaths as well as the number who used the Anti Retro Viral Therapy which is provided in order to treat those infected with human immunodeficiency using anti-HIV drugs which in turn, suppress the replication of HIV within someone’s body. We picked these three datasets in order to find out more about the disease and also correlate them to each other, as we did show you within our second interactive page. We made a chart that can be understood as showing the number of people living with HIV/AIDS and comparing it to the number of lives compromised by this deadly disease. To add to that, we used those datasets to make two more interactive visualizations in order to further explain how those datasets correlate with each other and determine the effectiveness of the ART therapy that was administered as well. One of which was a map that can be understood as the Antiretovirals map, and this map shows the percentage of antiretrovirals received by country out of how many were needed. Also within this map, as you hover over a specific country, the number of ART usage will be unveiled and it represents the amount of ART received from within that country. Lastly, our third visual interaction design can be understood as a bar chart that encompasses the ART therapy distribution among children that are infected with the virus. This bar chart also compares the number of children in need of antiviral therapy, to an estimated number of those currently receiving the treatment. The importance of this project can be taken away as allowing more data on the virus to be out there for medical companies such as those who make vaccines to take notice in order to get help allocated to the most affected by the said virus."),
  h3("To summarize, we used these interactive visualizations in order to encompass the idea of those living against those without HIV/AIDS in order to get a comparison of how different countries are affected by the HIV/AIDS virus. Along with those who are being treated for it compared to those who are not. The findings of this project were important as it allows us to differentiate which countries or even cities and such have more cases of HIV/AIDS. This in turn would hopefully compel researchers to help those who are the more affected populations first. Along with differentiating which countries may need more extensive help to address the virus concerns with medical professionals as well. All in all, we used three different visualizations, which were a map, a bar chart, and lastly another chart which all can explain or correlate the number of HIV/AIDS cases & deaths that occur in different countries. From these visualizations, the bar chart can show us the comparison of children who need and have Antiretroviral therapy which shows the disparity of the two which can be attested to lots of families including children that do not have adequate healthcare in order to suppress the effects of the virus. Along with not having adequate healthcare, things such as cultural and religious barriers occur as well, which put said children on the brink of not getting help due to some of the characteristics they portray. To go along with that, these visualizations can be understood as a stepping stone to helping shine light on the undermined and underrepresented people affected by this virus of all colors and from all walks of life. That would in turn help those affected by allowing people to be outraged at the fact that some people are unable to receive certain treatments due to discriminatory factors such as those mentioned above, which I believe should never be the case.")
  
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
