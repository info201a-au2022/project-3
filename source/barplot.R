prevention_mother_to_child <- read.csv("../data/prevention_mother_to_child.csv")

counts <- table(prevention_mother_to_child$`Received Antiretrovirals`)
barplot(counts, main = "Recieved Antiretrovirals",
        xlab = "Mother to Child Transmission Prevention")


