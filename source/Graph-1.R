library(ggplot2)
library(dplyr)
library(tidyr)
data <- ("/users/parkerhuang/documents/finalproject/final-project-starter-wenqic2-1976285/data/data-2.csv")
HIVdata <- read.csv(data, header = TRUE)

colnames(HIVdata)<-HIVdata[1,]
HIVdata <- HIVdata[-1,]

hivdata_2 <- HIVdata%>%
  pivot_longer(HIVdata, cols=2:32, names_to = "year", values_to = "Total_People_Living_With_HIV")
  
  
hivdata <- hivdata_2 %>%
  filter(`WHO region` == "Global")%>%
  mutate(people_with_hiv = gsub("\\[.*" ,"",hivdata$Total_People_Living_With_HIV))

hivdata$year <- as.numeric(hivdata$year)
hivdata$people_with_hiv <- as.factor(hivdata$people_with_hiv)
hivdata$people_with_hiv <- as.numeric(hivdata$people_with_hiv)

# Graph showing the number of cases in world each year
ggplot(hivdata, aes(year, people_with_hiv)) + geom_point() + xlim(1992,2020)+
  labs(x = "Year", y = "Number of people living with HIV", title = "Total People Living With HIV Each Year")




