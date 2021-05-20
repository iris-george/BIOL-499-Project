########## 
##########
# This code contains a one-script example for a reproducibility example
##########
##########
# AUTHOR: Iris M. George
# DATE OF CREATION: 2021-05-20
##########
##########

# set-up =======================================================================

library(tidyverse)
library(here)

setosa_subset <- read_csv(here("./output/setosa_subset_data.csv"))

# read_csv as opposed to read.csv is simply faster, and lets you set an argument for how many rows it looks at before guessing column types

# further subset data
setosa_subset = setosa_subset[which(setosa_subset$Petal.Width > 0.2), ]


# run a simple model
hist(setosa_subset$Sepal.Length)

setosa_model = glm(Sepal.Length ~ Petal.Width*Petal.Length, 
                   data = setosa_subset)

summary(setosa_model)
saveRDS(setosa_model, here('./output/setosa_model_object.rds'))

# read in rds and plot results
setosa_model = readRDS(here('./output/setosa_model_object.rds'))

# model prediction
new_data = data.frame(Petal.Length = seq(1.3, 1.9, 0.1),
                      Petal.Width = seq(0.3, 0.9, 0.1))
new_data$prediction = predict(setosa_model, new_data, type = "response")

write_csv(new_data, here("./output/new_data_for_prediction.csv"))
