######################
######################
 # This file reads in some data, cleans it, and exports it ready for analysis
 # In accordance with the results presented in George et al. (2021)
#####################
#####################
 # AUTHOR: Iris M. George
 # INSTANTIATION DATA: 2021-05-13
######################
######################

# set-up =============================================================================================

library(here) # lets you use relative paths istead of setwd all the time --> looks for the file and finds the relative path 
library(tidyverse)

# Naming Conventions

# 1. consistency --> always use the same format
# 2. use line and section documentation --> summarize sections and not purpose of particularly useful lines 


adding_sum <- function(x, y) {
  
  ################# Docstring ################
  # Docstring tells the reader what the function is supposed to do. Has the following three components:
  
  # Summary of function: 
  # function takes in two numeric parameters and returns their sum
  
  ##### PARAMETERS:
  # x [num] - an object of type numeric
  # y [num] - an object of type numeric
  
  ##### RETURNS:
  # z [num] - the sum of x & y
  
  z = x + y
  
  return(z)
}

adding_sum(9, 15)


#### SVC Lengths ####

SVC <- read_csv(here("./data/SVC_data.csv"))

c2 <- SVC %>%
  filter(SVC_abundance == 1) %>%
  mutate(
    L1 = NA,
    A1 = NA,
    L2 = NA,
    A2 = NA,
    L3 = SVC_mean_tl,
    A3 = SVC_abundance,
    L4 = NA,
    A4 = NA,
    L5 = NA,
    A5 = NA)

c3 <-SVC %>%
  filter(SVC_abundance == 2) %>%
  mutate(
    L1 = SVC_min_tl,
    A1 = 1,
    L2 = NA,
    A2 = NA,
    L3 = NA,
    A3 = NA,
    L4 = NA,
    A4 = NA,
    L5 = SVC_max_tl,
    A5 = 1)

c4 <- SVC %>%
  filter(SVC_abundance == 3) %>%
  mutate(
    L1 = SVC_min_tl,
    A1 = 1,
    L2 = NA,
    A2 = NA,
    L3 = SVC_mean_tl,
    A3 = 1,
    L4 = NA,
    A4 = NA,
    L5 = SVC_max_tl,
    A5 = 1)

c5 <- SVC %>%
  filter(SVC_abundance == 4) %>%
  mutate(
    L1 = SVC_min_tl,
    A1 = 1,
    L2 = NA,
    A2 = NA,
    L3 = SVC_mean_tl,
    A3 = 2,
    L4 = NA,
    A4 = NA,
    L5 = SVC_max_tl,
    A5 = 1)

c6 <- SVC %>%
  filter(SVC_abundance >= 5 &
           SVC_abundance <= 99) %>%
  mutate(
    L1 = SVC_min_tl,
    A1 = 1,
    L3 = SVC_mean_tl,
    A3 = (.5 * SVC_abundance),
    L5 = SVC_max_tl,
    A5 = 1,
    L2 = (L3 + L1) / 2,
    A2 = (SVC_abundance - (A1 + A3 + A5)) / 2,
    L4 = (L3 + L5) / 2,
    A4 = A2)

c7 <- SVC %>%
  filter(SVC_abundance > 99) %>%
  mutate(
    L1 = SVC_min_tl,
    A1 = (.01 * SVC_abundance),
    L3 = SVC_mean_tl,
    A3 = (.5 * SVC_abundance),
    L5 = SVC_max_tl,
    A5 = (.01 * SVC_abundance),
    L2 = (L3 + L1) / 2,
    A2 = (SVC_abundance - (A1 + A3 + A5)) / 2,
    L4 = (L3 + L5) / 2,
    A4 = A2)

# Bind SVC Lengths:
SVC_lengths <- combine(list(c2, c3, c4, c5, c6, c7))

# writing files ==================================================================

write_csv(SVC, here("./data/SVC_test.csv"))

# editing this file 










