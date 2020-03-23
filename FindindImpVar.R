library(tidyverse)
library(skimr)
library(randomForest)
library(ROCR)
library(car)
library(Boruta)


getwd()
setwd('C:/Users/anshu/Desktop/UNCC Courses/Big data Analytics/project/')
data <- read.csv("train1.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?")) 

#df <- df_04
glimpse(data)
skim(data)

colnames(data)

summary(data)
anyNA(data)
skim(data)
sapply(data, class)

## complete case for boruta - boruta cannot processs NAs in input
data <- data %>% drop_na()
## taking sample data for boruta
sdata <- data[sample(nrow(data),50000),]

sdata <- sdata %>% select(-c(PolicyNo))

## convert categorical to factors
categorical <- c(2, 3:6, 11, 15, 19:20, 25, 27, 29:37, 40:50, 52:54, 57:59, 61:63, 65)
sdata[,categorical] <- data.frame(apply(sdata[categorical], 2, as.factor))

sapply(sdata, class)

boruta <- Boruta(Loss_Ratio~., data = sdata, doTrace = 2)
print(boruta)
getSelectedAttributes(boruta, withTentative = F)

boruta_final <- TentativeRoughFix(boruta)
print(boruta_final)
getSelectedAttributes(boruta_final, withTentative = F)

plot(boruta_final, xlab = "", xaxt = "n")
lz<-lapply(1:ncol(boruta_final$ImpHistory),function(i)
  boruta_final$ImpHistory[is.finite(boruta_final$ImpHistory[,i]),i])
names(lz) <- colnames(boruta_final$ImpHistory)
Labels <- sort(sapply(lz,median))
axis(side = 1,las=2,labels = names(Labels),
     at = 1:ncol(boruta_final$ImpHistory), cex.axis = 0.7)