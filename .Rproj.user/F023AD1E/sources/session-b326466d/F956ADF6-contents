library(fs)
library(here)
library(tidyverse)
library(waldo)

listening_1_control_pre <- dir_ls(here("data", "listenings", "Listening1", "Control", "pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))

listening_2_control_pre <- dir_ls(here("data", "listenings", "Listening2", "Control", "pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))

control_pre = rbind(listening_1_control_pre, listening_2_control_pre) %>% 
  group_by(ppt) %>% 
  summarize(correct_total = sum(correct)) %>% 
  mutate(group = "control") %>% 
  mutate(test = "pre")


listening_1_control_post <- dir_ls(here("data", "listenings", "Listening1", "Control", "post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))


listening_2_control_post <- dir_ls(here("data", "listenings", "Listening2", "Control", "post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))

control_post = rbind(listening_1_control_post, listening_2_control_post) %>% 
  group_by(ppt) %>% 
  summarize(correct_total = sum(correct)) %>% 
  mutate(group = "control") %>% 
  mutate(test = "post")




listening_1_treatment_pre <- dir_ls(here("data", "listenings", "Listening1", "Treatment", "pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))


listening_2_treatment_pre <- dir_ls(here("data", "listenings", "Listening2", "Treatment", "pre"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))


treatment_pre = rbind(listening_1_treatment_pre, listening_2_treatment_pre) %>% 
  group_by(ppt) %>% 
  summarize(correct_total = sum(correct)) %>% 
  mutate(group = "treatment") %>% 
  mutate(test = "pre")



listening_1_treatmentl_post <- dir_ls(here("data", "listenings", "Listening1", "Treatment", "post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))


listening_2_treatment_post <- dir_ls(here("data", "listenings", "Listening2", "Treatment", "post"), regexp = "\\.csv$") %>% 
  read_csv() %>% 
  mutate(ppt = substr(participant, 1, 3)) %>% 
  filter(!is.na(respuestaquestions.corr)) %>% 
  select(ppt, respuestaquestions.corr) %>% 
  group_by(ppt) %>% 
  summarize(correct = sum(respuestaquestions.corr))


treatment_post = rbind(listening_1_treatmentl_post, listening_2_treatment_post) %>% 
  group_by(ppt) %>% 
  summarize(correct_total = sum(correct)) %>% 
  mutate(group = "treatment") %>% 
  mutate(test = "post")

listening_df = rbind(treatment_pre, treatment_post, control_pre, control_post) %>% 
  write.csv(here("data", "tidy", "listening_df.csv"))
