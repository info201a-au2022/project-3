# histogram

deaths <- read_csv("~/Documents/info201/project-group-4-section-ab/data/no_of_deaths_by_country_clean.csv")

frequencies_of_median_deaths_per_country <- deaths$Count_median

hist(frequencies_of_median_deaths_per_country)




