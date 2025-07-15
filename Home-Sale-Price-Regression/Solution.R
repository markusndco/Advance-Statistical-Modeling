  # Load required libraries
  library(ggplot2)
  library(readxl)
  library(rio)
  library(moments)
  library(stargazer)
  library(corrplot)
  library(ellipse)
  
  
  # Load data
  file_path <- "C:/Users/91884/Desktop/BAIS/Statistical Data Mining/2/Assignment 2/HuntersGreenHomeSales (1).xlsx"
  data <- read_excel(file_path)
  
  # Preprocessing
  colnames(data) <- tolower(make.names(colnames(data))) 
  data$roof <- factor(data$roof)
  data$pool <- factor(data$pool)
  data$address <- factor(data$address)
  
  # Check factor levels
  sapply(data, function(x) length(levels(x)))
  
  # Fit linear regression model
  model1 <- lm(pricesold ~  beds + bathstotal + sqft + garages + roof + lotsqft + yrblt + pool + subdivn + listprice + datesold + splsale, data = data)
  summary(model1)
  model2 <- lm(pricesold ~  beds + bathstotal + sqft + garages + roof + lotsqft + yrblt + pool + listprice + datesold + splsale, data = data)
  summary(model2)
  model3 <- lm(pricesold ~  beds + bathstotal + sqft + garages + roof + lotsqft + listprice + datesold, data = data)
  summary(model3)
  
  #Stargazer
  stargazer(model1, model2, model3,
            type = "text", single.row=TRUE,
            title = "Comparison of OLS Models",
            align = TRUE)
  
  par(mfrow=c(2,3))  # 2 rows, 3 columns
  
  # Linear- Residuals vs. Fitted Values Plot
  plot(model1$fitted.values, residuals(model1), main = "Residuals vs. Fitted", xlab = "Fitted Values", ylab = "Residuals")
  
  # Independance- Residuals vs. Order Plot
  plot(residuals(model1) ~ seq_along(residuals(model1)), main = "Residuals vs. Order", xlab = "Order of Data", ylab = "Residuals")
  
  # Histogram of Residuals
  hist(residuals(model1), main = "Histogram of Residuals")
  
  # Q-Q Plot
  qqnorm(residuals(model1))
  qqline(residuals(model1))
  
  # Equal Variance - Residuals vs. Fitted Values Plot (Standardized)
  std_resid <- residuals(model1) / sqrt(summary(model1)$sigma^2)
  plot(model1$fitted.values, std_resid, main = "Standardized Residuals vs. Fitted", xlab = "Fitted Values", ylab = "Standardized Residuals")
  abline(h = 0, col = "red", lty = 2)
  
  # Calculate the correlation matrix for continuous variables, handling missing values
  continuous_vars <- subset(data, select = c("beds", "bathstotal", "sqft", "garages", "lotsqft", "yrblt", "listprice", "pricesold"))
  cor_matrix <- cor(continuous_vars, use = "pairwise.complete.obs")
  
  # Plot correlation matrix with ellipses
  corrplot(cor_matrix, method = "ellipse", type = "upper", order = "hclust", tl.col = "black")
  
  # Plot correlation matrix with numeric values
  corrplot(cor_matrix, method = "number", type = "upper", order = "hclust", tl.col = "black")
  
  # Add title above the set of plots
  mtext("LINE Assumptions for Sale Price of homes ", side = 0, line = 1)
  
  
