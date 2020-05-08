
rm(list = ls())
library(ggplot2)
library(dplyr)
library(randomForest)
library(caTools)
# Import data
mydata <- read.csv("C:/Users/robna/Desktop/Breast Cancer biomarkers.csv")

#standerdize data frame
mydata <- scale(mydata, center = TRUE, scale = TRUE)

# set seed 
set.seed(42)

#shuffle row indicies
rows <- sample(nrow(mydata))

#randomly order data
random_data <- mydata[rows, ]

#split data
split <- round(nrow(mydata) * .8)

#create train
train <- mydata[1:split, ]

#create split
test <- mydata[(split + 1):nrow(mydata), ]

#train <- mydata[1:58,]
#test <- mydata[59:116,]

# Logistic Regression
mylogit <- glm(Classification ~ BMI + Glucose + Resistin, family = "binomial", data = train)
result1 <- summary(mylogit)

#predict LR model
predict.test <- as.data.frame(predict(mylogit, newdata = test, type ="response"))

#ROC curve that means nothing to me 
colAUC(predict.test, test[["Classification"]], plotROC = TRUE)


# Predicition Results LR
fitted.results <- predict(mylogit, newdata = test)
fitted.results <- ifelse(fitted.results > 0.5 , 1, 0)
1 - mean(fitted.results != test$Classification)

#Random Forest
RFmodel <- randomForest(Classification ~ BMI + Glucose + Resistin, data = train) 
result2 <- summary(RFmodel)

#predict RF
predict.test2 <- as.data.frame(predict(RFmodel, newdata = test, type = "response"))

# Predicition Results RF
fitted.results <- predict(mylogit, newdata = test)
fitted.results <- ifelse(fitted.results > 0.5 , 1, 0)
1 - mean(fitted.results != test$Classification)
