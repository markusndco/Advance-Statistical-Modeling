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
file_path <- "C:/Users/91884/Desktop/BAIS/Statistical Data Mining/3/Assignment/CreditCardTransactions.xlsx"
data <- read_excel(file_path)
summary(data)
str(data)

#asfactor
data$WealthGroup <- factor(data$WealthGroup)
data$SpendGroup <- factor(data$SpendGroup)
data$CardGroup <- factor(data$CardGroup)
data$RevolvingGroup <- factor(data$RevolvingGroup)
str(data)


# Transaction count regression
model1 <- lm(TransAmount ~ TransCount + SpendGroup + CardGroup + WealthGroup + RevolvingGroup, data = data)
summary(count_model1)
model2 <- lm(log(TransAmount) ~ TransCount + SpendGroup + CardGroup + WealthGroup + RevolvingGroup, data = data)
summary(count_model2)

stargazer(model1, model2, 
          type = "text", single.row=TRUE,
          title = "Comparison of OLS Models",
          align = TRUE)

par(mfrow=c(2,3))

# Linear- Residuals vs. Fitted Values Plot
plot(model2$fitted.values, residuals(model2), main = "Residuals vs. Fitted", xlab = "Fitted Values", ylab = "Residuals")

# Independance- Residuals vs. Order Plot
plot(residuals(model2) ~ seq_along(residuals(model2)), main = "Residuals vs. Order", xlab = "Order of Data", ylab = "Residuals")

# Histogram of Residuals
hist(residuals(model2), main = "Histogram of Residuals")

# Q-Q Plot
qqnorm(residuals(model2))
qqline(residuals(model2))

# Equal Variance - Residuals vs. Fitted Values Plot (Standardized)
std_resid <- residuals(model2) / sqrt(summary(model2)$sigma^2)
plot(model2$fitted.values, std_resid, main = "Standardized Residuals vs. Fitted", xlab = "Fitted Values", ylab = "Standardized Residuals")
abline(h = 0, col = "red", lty = 2)

# Kolmogorov-Smirnov Test for Normality (for model2)
ks_test_model2 <- ks.test(residuals(model2), "pnorm")
cat("Kolmogorov-Smirnov Test for Normality (Model 2):\n")
print(ks_test_model2)

#BP for Homogeneity of Variances (for model2)
bptest(model2)

#VIF test for multicollinearity 
vif_model2 <- car::vif(model2)
print("Variance Inflation Factors (VIF) for Model 2:")
print(vif_model2)


