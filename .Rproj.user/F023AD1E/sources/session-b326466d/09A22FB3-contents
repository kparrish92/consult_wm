library(fs)
library(here)
library(tidyverse)
library(waldo)



# Missing ppts and trim RTs 

control_stroop_Post <- dir_ls(here("data", "stroop", "control", "Post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(key_resp_trials.rt)) %>% 
  filter(key_resp_trials.rt > .5, key_resp_trials.rt < 2) %>% 
  group_by(congruent, ppt) %>% 
  summarize(rt_mean = mean(key_resp_trials.rt)) %>% 
  pivot_wider(names_from = congruent, values_from = rt_mean) %>% 
  mutate(stroop_effect = no - yes) %>% 
  mutate(group = "control") %>% 
  mutate(test = "post")

control_stroop_Pre <- dir_ls(here("data", "stroop", "control", "Pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(key_resp_trials.rt)) %>% 
  filter(key_resp_trials.rt > .5, key_resp_trials.rt < 2) %>% 
  group_by(congruent, ppt) %>% 
  summarize(rt_mean = mean(key_resp_trials.rt)) %>% 
  pivot_wider(names_from = congruent, values_from = rt_mean) %>% 
  mutate(stroop_effect = no - yes) %>% 
  mutate(group = "control") %>% 
  mutate(test = "pre")


treatment_stroop_Post <- dir_ls(here("data", "stroop", "treatment", "Post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(key_resp_trials.rt)) %>% 
  filter(key_resp_trials.rt > .5, key_resp_trials.rt < 2) %>% 
  group_by(congruent, ppt) %>% 
  summarize(rt_mean = mean(key_resp_trials.rt)) %>% 
  pivot_wider(names_from = congruent, values_from = rt_mean) %>% 
  mutate(stroop_effect = no - yes) %>% 
  mutate(group = "treatment") %>% 
  mutate(test = "post")


treatment_stroop_Pre <- dir_ls(here("data", "stroop", "treatment", "Pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(key_resp_trials.rt)) %>% 
  filter(key_resp_trials.rt > .5, key_resp_trials.rt < 2) %>% 
  group_by(congruent, ppt) %>% 
  summarize(rt_mean = mean(key_resp_trials.rt)) %>% 
  pivot_wider(names_from = congruent, values_from = rt_mean) %>% 
  mutate(stroop_effect = no - yes) %>% 
  mutate(group = "treatment") %>% 
  mutate(test = "pre")

stroop_df = rbind(control_stroop_Post, control_stroop_Pre, treatment_stroop_Post, treatment_stroop_Pre) 
stroop_df %>% 
  write.csv(here("data", "tidy", "stroop_tidy.csv"))
