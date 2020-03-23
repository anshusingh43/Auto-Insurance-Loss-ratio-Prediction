getwd()
setwd("C:/Users/anshu/Desktop/UNCC Courses/Big data Analytics/project")

data <- read.csv("train1.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?")) 

data_new <- data %>% select(PolicyNo,
                            Vehicle_Make_Year,
                            Vehicle_Number_Of_Drivers_Assigned,
                            Vehicle_Usage,
                            Vehicle_Collision_Coverage_Indicator,
                            Vehicle_Collision_Coverage_Deductible,
                            Driver_Total_Teenager_Age_15_19,
                            Driver_Total_Married,
                            Driver_Total_Related_To_Insured_Spouse,
                            Driver_Total_Related_To_Insured_Child,
                            Driver_Total_Adult_Ages_50_64,
                            Driver_Total_Senior_Ages_65_69,Driver_Total_Upper_Senior_Ages_70_plus,
                            EEA_Liability_Coverage_Only_Indicator,
                            Annual_Premium,
                            Claim_Count,
                            Loss_Amount,
                            Frequency,Severity,
                            Loss_Ratio)

data_new <- data %>%
  sample_n(100000)

library(dplyr)
library(tidyverse)


data_1_new <- data_new[complete.cases(data_new),]#dropping variables

#train data
train_data <- data_1_new %>% sample_frac(.70)

#test data
test_data <- anti_join(data_1_new,train_data)

install.packages("randomForest")
library(randomForest)
library(tidyverse)
library(dplyr)
set.seed(32) 

train_data <- as.factor(train_data)#converting all column in 0 and 1

summary(train_data)

rf <-randomForest(Loss_Ratio~., data=train_data, ntree=10, na.action=na.exclude, importance=T,
                  proximity=T) 
rf