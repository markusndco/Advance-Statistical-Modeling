rm(list=ls())

# Load required libraries
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


# Load data
file_path <- ("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/6/data.xlsx") 
data <- read_excel(file_path)


#asfactor
data$CellType <- factor(data$CellType)
str(data)


#Kalplan-Meier Analysis:   
fit <- survfit(Surv(SurvivalInDays,Status) ~ Treatment, data = data)
plot(fit, main = "Kaplan-Meier Survival Curve", xlab = "Time in days", ylab = "Survival Probability",col ="Red",lwd=2,)
legend("topright", legend = "Survival Curve", col = "Red", lty = 1, lwd = 2)
summary(fit)


#models
cox_model=  coxph(Surv(SurvivalInDays,Status) ~ Treatment + CellType + AgeInYears  + MonthsFromDiagnosis + PriorChemotherapy, data = data)
exp= survreg(Surv(SurvivalInDays,Status) ~ Treatment + CellType + AgeInYears  + MonthsFromDiagnosis + PriorChemotherapy,dist = "exponential", data = data)
weibull= survreg(Surv(SurvivalInDays,Status) ~ Treatment + CellType + AgeInYears  + MonthsFromDiagnosis + PriorChemotherapy,dist = "weibull", data = data)
loglogistic= survreg(Surv(SurvivalInDays,Status) ~ Treatment + CellType + AgeInYears  + MonthsFromDiagnosis + PriorChemotherapy,dist = "loglogistic", data = data)

# Summary of the models
stargazer(cox_model,exp,weibull,loglogistic,
          type = "text", single.row=TRUE,
          title = "Comparison of OLS Models",
          align = TRUE)


#Correlation test
correlation_matrix <- cor(data[c("SurvivalInDays", "Status","KarnofskyScore","MonthsFromDiagnosis","AgeInYears","PriorChemotherapy")])
corrplot(correlation_matrix, method = "pie")
print(correlation_matrix)


# Estimate survival probability at 365 days
time_point <- 365 
summary_fit <- summary(fit, times = time_point)
print(summary_fit$surv)

# Estimate survival probability at 180 days
time_point2 <- 180
summary_fit <- summary(fit, times = time_point2)
print(summary_fit$surv)
