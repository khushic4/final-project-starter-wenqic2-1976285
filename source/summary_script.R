library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)


WHO_HIV <- read.csv('data (1).csv', header=TRUE)
colnames(WHO_HIV) <- WHO_HIV[1,]
WHO_HIV <- WHO_HIV[-1,]

WHO_HIV_total <- WHO_HIV %>%
  gather(key = Year,
         value = lives_total,
         - `WHO region`) %>%
  mutate(lives_with_hiv = gsub("\\[.*" ,"",WHO_HIV_total$lives_total)) %>%
  mutate(lives_with_hiv_no_spaces = as.numeric(gsub(" ","",WHO_HIV_total$lives_with_hiv)))
## manipulated the data to show the number of people living with HIV in each of the WHO Regions in the following columns; 
##"WHO region," "Year," "Lives total," and then eliminated the brackets so we could read the total number of humans
## living with HIV. 


summary_info <- list()
  summary_info$total_in_2020 <- WHO_HIV_total %>%
    filter(Year == max(Year)) %>%
    filter(lives_with_hiv_no_spaces == max(lives_with_hiv_no_spaces)) %>%
    pull(lives_with_hiv_no_spaces)
  summary_info$africa_data <- WHO_HIV_total %>%
    filter(`WHO region` == 'Africa') %>%
    pull(lives_with_hiv)
  summary_info$global_data <- WHO_HIV_total %>%
    filter(`WHO region` == 'Global') %>%
    pull(lives_with_hiv)
  summary_info$max_in_2020 <- WHO_HIV_total %>%
    filter(Year == max(Year)) %>%
    filter(`WHO region` != 'Global') %>%
    filter(lives_with_hiv_no_spaces == max(lives_with_hiv_no_spaces)) %>%
    pull(`WHO region`)
  summary_info$americas_data_2019 <- WHO_HIV_total %>%
    filter(Year == '2019') %>%
    filter(`WHO region` == 'Americas') %>%
    pull(lives_with_hiv_no_spaces)

    
