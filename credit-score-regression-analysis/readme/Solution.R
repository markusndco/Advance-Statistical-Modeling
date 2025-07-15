rm(list=ls())

library(ggplot2)
libraray(readxl)
library(rio)
library(moments)
library(stargazer)

#Preprocessing
#Loading data
file_path=("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/1/CreditRating.xlsx") 
data= read_excel(file_path) #attaching the data to a variable
colnames(data)=tolower(make.names(colnames(data))) #lowercase column names for usage ease
str(data)

#Models
model1 = lm(rating ~ income + limit + cards + age + education + gender + student + married + ethnicity + balance, data = data)
summary(model1)
model2 = lm(rating ~ income + limit + cards + married + balance, data = data)
summary(model2)


summary_model1= summary(model1)
summary_model2= summary(model2)

stargazer(model1,model2, 
          type = "text", 
          title = "Comparison of OLS Models",
          align = TRUE)
