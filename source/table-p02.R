library(tidyverse)
library(tidyr)
library(RcppRoll)
library(stringr)
library(dplyr)


lives <- read.csv("data.csv", header = T)
colnames(lives) <- lives[1,]
lives <- lives[-1,]
global_lives <- lives %>%
  gather(key = Year, 
         value = original_live_number,
         -`WHO region`) %>% 
  filter(`WHO region` == "Global") %>% 
  mutate(lives_with_hiv = gsub("\\[.*" ,"",global_lives$original_live_number)) %>% 
  mutate(estimate_lives_with_hiv = gsub(" " ,"",global_lives$lives_with_hiv)) %>% 
  arrange(Year) %>% 
  mutate(new_lives_per_year = as.numeric(estimate_lives_with_hiv) - lag(as.numeric(estimate_lives_with_hiv), 1)) %>% 
  select(-lives_with_hiv)

View(global_lives)




  





  
  
  
  
  
  
