rm(list=ls())

# Load required libraries
library(ggplot2)
library(readxl)
library(rio)
library(moments)
library(stargazer)
library(corrplot)
library(ellipse)
library(car)
library(lmtest)
library(corrplot)


# Load data
file_path <- ("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/4/Assignment/OnlineRetailPromotions.xlsx") 
data <- read_excel(file_path)
summary(data)
str(data)

#asfactor
data$historysegment <- factor(data$historysegment)
data$zipcode <- factor(data$zipcode)
data$channel <- factor(data$channel)
data$campaign <- factor(data$campaign)
data$Gender <- factor(data$Gender)
data$conversion <- factor(data$conversion)
data$visit <- factor(data$visit)
str(data)

#histogram of Y variable
hist(data$spend)
hist(log(data$spend)) 
hist(lm(data$spend)) 

#Correlation test
correlation_matrix <- cor(data[c("history", "recency")])
corrplot(correlation_matrix, method = "pie")
print(correlation_matrix)


# Fit GLM models
glm_model1 <- glm(spend ~ recency + historysegment + history + Gender + conversion + visit + zipcode + newcustomer + channel + campaign, 
                  data = data, 
                  family = gaussian(link = "identity"))

glm_model_log <- glm(spend ~ recency + historysegment + history + Gender + conversion + visit + zipcode + newcustomer + channel + campaign, 
                     data = data, 
                     family = gaussian(link = "log"))
glm_model_exp <- glm(spend ~ recency + historysegment + history + Gender + conversion + visit + zipcode + newcustomer + channel + campaign, 
                     data = data, 
                     family = gaussian(link = "inverse"))

# Summary of the models
summary(glm_model1)
summary(glm_model_log)
summary(glm_model_exp)
stargazer(glm_model1,glm_model2,glm_model3,
          type = "text", 
          title = "Comparison of OLS Models",
          align = TRUE)


