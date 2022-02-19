library(ggplot2)
library(dplyr)
library(tidyr)
data <- ("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-wenqic2-1976285/main/data/data-2.csv")
HIVdata <- read.csv(data, header = TRUE)

colnames(HIVdata)<-HIVdata[1,]
HIVdata <- HIVdata[-1,]

hivdata_2 <- HIVdata%>%
  pivot_longer(HIVdata, cols=2:32, names_to = "year", values_to = "Total_People_Living_With_HIV")
  

hivdata <- hivdata_2 %>%
  filter(`WHO region` == "Global")%>%
  mutate(people_with_hiv = gsub("\\[.*" ,"",hivdata$Total_People_Living_With_HIV))%>%
  mutate(people_with_hiv = gsub(" ", "", hivdata$people_with_hiv))

hivdata$year <- as.numeric(hivdata$year)
hivdata$people_with_hiv <- as.numeric(hivdata$people_with_hiv)

# Graph showing the number of cases in world each year
ggplot(hivdata, aes(year, people_with_hiv)) + geom_line() + 
  scale_y_continuous(labels = scales::comma)+
  labs(x = "Year", y = "Number of people living with HIV", title = "Total People Living With HIV Each Year")


# This graph show how the global number of people with HIV increase from 1990 to 2020. This graph shows that 
# the number of HIV cases increased pretty quickly from 1990 to about two thousand and then it slowed down
# significantly. This graph also show that around 2008 or 2009 the number cases started to pick up again,
# but did not get anywhere close to where it was in the 90s.


