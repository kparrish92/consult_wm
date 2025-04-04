library(fs)
library(here)
library(tidyverse)
library(waldo)

control_rm_Pre <- dir_ls(here("data", "running_memory", "control", "Pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(userID, 1, 3)) %>% 
  filter(!is.na(correct)) %>% 
  group_by(ppt, correct) %>% 
  summarize(n = n()) %>% 
  filter(correct == TRUE) %>% 
  mutate(group = "control") %>% 
  mutate(test = "pre")

control_rm_Post <- dir_ls(here("data", "running_memory", "control", "Post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(userID, 1, 3)) %>% 
  filter(!is.na(correct)) %>% 
  group_by(ppt, correct) %>% 
  summarize(n = n()) %>% 
  filter(correct == TRUE) %>% 
  mutate(group = "control") %>% 
  mutate(test = "post")

treatment_rm_Pre <- dir_ls(here("data", "running_memory", "treatment", "Pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(userID, 1, 3)) %>% 
  filter(!is.na(correct)) %>% 
  group_by(ppt, correct) %>% 
  summarize(n = n()) %>% 
  filter(correct == TRUE) %>% 
  mutate(group = "treatment") %>% 
  mutate(test = "pre")

treatment_rm_Post <- dir_ls(here("data", "running_memory", "treatment", "Post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(userID, 1, 3))  %>% 
  filter(!is.na(correct)) %>% 
  group_by(ppt, correct) %>% 
  summarize(n = n()) %>% 
  filter(correct == TRUE) %>% 
  mutate(group = "treatment") %>% 
  mutate(test = "post")


wm_df = rbind(control_rm_Post, control_rm_Pre, treatment_rm_Post, treatment_rm_Pre)

wm_df %>% 
  write.csv(here("data", "tidy", "wm_tidy.csv"))