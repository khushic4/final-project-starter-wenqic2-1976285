library(ggplot2)
library(dplyr)
library(tidyr)

data <- ("/users/andyc/documents/info201code/final-project-starter-wenqic2-1976285/data/data-2.csv")
regional_data <- read.csv(data)

colnames(regional_data) <- regional_data[1,]
americas_data <- regional_data[-c(1,2,3,5,6,7,8), ]
americas_data <- americas_data[ ,-1]

americas_data[ ,1:31] <- gsub(" \\[.*", "", americas_data[ ,1:31])
americas_data[ ,1:31] <- gsub(" ", "", americas_data[ ,1:31])
americas_data_final <- pivot_longer(americas_data, cols = 1:31, names_to = "year", values_to = "living_with_HIV")

americas_data_final$year = as.numeric(americas_data_final$year)
americas_data_final$living_with_HIV = as.numeric(americas_data_final$living_with_HIV)

boxplot <- ggplot(americas_data_final, aes(year, living_with_HIV))
boxplot + geom_bar(stat = "identity", color = "black", fill = "red") +
  xlab("Year") + ylab("People Living with HIV") +
  labs(title = "People living with HIV in the Americas (1990-2020)")

# This graph tracks the number of people living with HIV in specifically the
# region of the Americas from the years 1990-2020. By looking at this bar chart,
# a steady upwards trend can clearly be seen. This shows that in this region,
# not enough advancements have been made in terms of protection from and medicine
# for HIV. Collecting data like this for a region rather than globally assists in
# providing more specific data to look at for each region to see what they can
# change.
