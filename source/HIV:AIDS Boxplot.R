# boxplot

HIV_AIDS_dataset <- read_csv("~/Desktop/#people_living_with_HIV.csv")

ggplot(HIV_AIDS_dataset, aes(x=as.factor(Country), y=Count_median)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("Country")

