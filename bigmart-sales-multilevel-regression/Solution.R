rm(list=ls())

# Load required libraries
library(ggplot2)
library(readxl)
library(rio)
library(moments)
library(lattice)
library(stargazer)
library(corrplot)
library(ellipse)
library(car)
library(lmtest)
library(corrplot)
library(lme4)


# Load data
file_path <- ("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/5/Assignment/BigMartSales (1).xlsx") 
data <- read_excel(file_path)
summary(data)
str(data)

#creating a column variable
data$yearsofoutlet = 2024 - data$Outlet_Year


#histogram of Y variable
hist(data$Item_Sales)
hist(log(data$Item_Sales)) 

#boxplot of Y variable
bwplot(Item_Sales ~ Outlet_Type, data=data)
bwplot(Item_Sales ~ City_Type, data=data)
bwplot(Item_Sales ~ Outlet_Size, data=data)

table(data$Outlet_Type)

#Correlation test
correlation_matrix <- cor(data[c("Item_Weight", "Item_Visibility","Item_MRP","Outlet_Year","Item_Sales")])
corrplot(correlation_matrix, method = "pie")
print(correlation_matrix)


# Fit GLMER models``

model_1 <- lm(log(Item_Sales)~ Item_Visibility + Outlet_Size + Item_Type + log(Item_MRP) + Outlet_ID + Outlet_Type + City_Type + yearsofoutlet,data=data)
model_2 <- lmer(log(Item_Sales)~ Item_Visibility + Item_Type + log(Item_MRP) + Outlet_Type + City_Type + yearsofoutlet +(1|Outlet_ID),data=data,REML=FALSE)
model_3 <- lmer(log(Item_Sales)~ Item_Visibility + Item_Type + log(Item_MRP) + Outlet_Type + City_Type + yearsofoutlet +(1|Outlet_ID/City_Type),data=data,REML=FALSE)
# Summary of the models

stargazer(model_1,model_2,model_3,
          type = "text", single.row=TRUE,
          title = "Comparison of OLS Models",
          align = TRUE)


AIC(model_1,model_2,model_3)
BIC(model_1,model_2,model_3)

# **Assumption Testing
dispersiontest(model_1)
dispersiontest(model_2)
dispersiontest(model_3)




