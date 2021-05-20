########## 
##########
# This main file calls and runs all subsequent R files in this analysis 
##########
##########
# AUTHOR: Iris M. George
# DATE OF CREATION: 2021-05-20
##########
##########

# set-up =======================================================================
library(here)

# data wrangling ===============================================================

# This script reads in iris data and performs some simple data wrangling, then writes out files needed for model fitting 

source(here("./src/data-wrangling.R"))

# model fitting ================================================================

# This script reads in the appropriate csvs and fits a shitty GLM, then makes a model prediction on in and out of sample data

rm(list = ls()) # finds everything in the environment and removes it, frees up memory space; gets rid of intermediate things that you no longer need
source(here("./src/model_fitting.R"))

# model visualization ==========================================================

# This script reads in two dataframes and creates and saves simple plots

rm(list = ls())
source(here("./src/visualization.R"))



