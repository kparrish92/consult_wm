library(fs)
library(here)
library(tidyverse)
library(waldo)


reading <- read_excel("data/reading_comp/reading.xlsx") %>% 
  mutate(ppt = substr(`Welcome!`, 1, 3)) %>% 
  janitor::clean_names() %>% 
  select(sc0re, ppt, group, pre_or_post) %>% 
  rename("test" = pre_or_post) %>% 
  rename("score" = sc0re) %>% 
  mutate(group = case_when(
    group == "C" ~ "control",
    group == "T" ~ "treatment"
  )) %>% 
  mutate(test = case_when(
    test == "PRE" ~ "pre",
    test == "POST" ~ "post"
  ))

reading %>% 
  write.csv(here("data", "tidy", "reading_tidy.csv"))
