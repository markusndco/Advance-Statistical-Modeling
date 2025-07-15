rm(list=ls())

#libraries
library(recipes2)
library(ggplot2)
library(readxl)
library(rio)
library(moments)
library(lattice)
library(stargazer)
library(car)
library(lmtest)
library(corrplot)
library(survival)
library(caret)
library(ROCR)
library(dplyr)
library(corrplot)
library(lme4)

# Load data
 
stores_data = read_excel("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/8/SnackChain (2).xlsx", sheet = "stores")
product_data = read_excel("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/8/SnackChain (2).xlsx", sheet = "products")
transaction_data = read_excel("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/8/SnackChain (2).xlsx", sheet = "transactions")
merged_data1 <- left_join(transaction_data, product_data, by = "UPC")
data <- left_join(merged_data1, stores_data, by = "STORE_ID")

str(data)

#correlation
correlation_matrix <- cor(data[c("STORE_ID", "UPC","UNITS","VISITS","HHS","SPEND","PRICE","BASE_PRICE","FEATURE","DISPLAY","TPR_ONLY","MSA","PARKING","SIZE","AVG_WEEKLY_BASKETS")])
corrplot(correlation_matrix, method = "pie")
print(correlation_matrix)

#asfactor
data$DISPLAY = factor(data$DISPLAY)
data$STATE = factor(data$STATE)
data$CATEGORY = factor(data$CATEGORY)
data$SEGMENT = factor(data$SEGMENT)
data$FEATURE = factor(data$FEATURE)
data$TPR_ONLY = factor(data$TPR_ONLY)
data$DESCRIPTION = factor(data$DESCRIPTION)

#histogram of Y variable
hist(data$SPEND)
hist(log(data$SPEND)) 

hist(data$UNITS)
hist(log(data$UNITS)) 

hist(data$HHS)
hist(log(data$HHS))

#boxplot of Y variable
bwplot(SPEND ~ STATE, data=data)
bwplot(SPEND ~ CATEGORY, data=data)

bwplot(UNITS ~ STATE, data=data)
bwplot(UNITS ~ CATEGORY, data=data)

bwplot(HHS ~ STATE, data=data)
bwplot(HHS ~ CATEGORY, data=data)

#models

model_1 <- lmer(log(SPEND)~ FEATURE + DISPLAY + log(PRICE) + STATE + PRODUCT_SIZE + CATEGORY + SEGMENT + TPR_ONLY +(1|STORE_ID),data=data,REML=FALSE)
model_2 = lmer(log(UNITS)~ FEATURE + DISPLAY + log(PRICE) + STATE + PRODUCT_SIZE + CATEGORY + SEGMENT + TPR_ONLY  +(1|STORE_ID),data=data,REML=FALSE)
model_3 = lmer(log(HHS)~ FEATURE + DISPLAY + log(PRICE) + STATE + PRODUCT_SIZE + CATEGORY + SEGMENT + TPR_ONLY  +(1|STORE_ID),data=data,REML=FALSE)
model_4 = lmer(log(SPEND) ~ FEATURE * DISPLAY * TPR_ONLY * CATEGORY * SEGMENT + log(PRICE) + STATE + PRODUCT_SIZE + (1|STORE_ID), data = data, REML = FALSE)

#Summary of the models

stargazer(model_1,model_2, model_3,
          type = "text", single.row=TRUE,
          title = "Comparison of OLS Models",
          align = TRUE)

summary(model_4)

#AIC and BIC
AIC(model_1,model_2,model_3)
BIC(model_1,model_2,model_3)



# Question3 the five most price elastic and five least price elastic products
data$log_UNITS <- log(data$UNITS)
data$log_PRICE <- log(data$PRICE)

#unique identifier for each product (UPC)
product_UPCs <- unique(data$UPC)
elasticities <- numeric(length(product_UPCs))

for (i in seq_along(product_UPCs)) {
  # Subset data for each product
  product_data <- subset(data, UPC == product_UPCs[i])
  
  # Fit regression model
  model <- lm(log_UNITS ~ log_PRICE, data = product_data)
  
  # Extract coefficient of log price
  elasticity <- coef(model)["log_PRICE"]
  
  # Calculate price elasticity
  mean_price <- mean(product_data$PRICE)
  mean_units <- mean(product_data$UNITS)
  elasticities[i] <- elasticity * (mean_price / mean_units)
}

#Rank Products
ranked_products <- data.frame(UPC = product_UPCs, Price_Elasticity = elasticities)
ranked_products <- ranked_products[order(abs(ranked_products$Price_Elasticity), decreasing = TRUE), ]

#Select Top and Bottom Five
top_five <- ranked_products[1:5, ]
bottom_five <- ranked_products[(nrow(ranked_products) - 4):nrow(ranked_products), ]

#Print top and bottom five products
print("Top Five Most Price Elastic Products:")
print(top_five)
print("Bottom Five Least Price Elastic Products:")
print(bottom_five)


#question4 
model_6 <- lm(log_UNITS ~ log_PRICE + UPC, data = data)

price_elasticities <- coef(model_6)["log_PRICE"] * (data$PRICE / data$UNITS)

# Maximizing Product Sales
products_maximize_sales <- data[data$UPC %in% unique(data$UPC[price_elasticities > 1]), ]

# Maximizing Unit Sales
products_maximize_units <- data[data$UPC %in% unique(data$UPC[abs(price_elasticities) == max(abs(price_elasticities))]), ]

# Print the UPCs of products to lower the price for maximizing product sales
print("Products to Lower Price for Maximizing Product Sales:")
print(unique(products_maximize_sales$UPC))

# Print the UPCs of products to lower the price for maximizing unit sales
print("Products to Lower Price for Maximizing Unit Sales:")
print(unique(products_maximize_units$UPC))

