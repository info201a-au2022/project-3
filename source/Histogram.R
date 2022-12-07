# histogram

deaths <- read.csv("data/no_of_deaths_by_country_clean.csv")

frequencies_of_median_deaths_per_country <- deaths$Count_median

histogram <- hist(frequencies_of_median_deaths_per_country)




