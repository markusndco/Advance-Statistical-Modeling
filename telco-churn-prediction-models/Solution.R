rm(list=ls())
install.packages("recipes")


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


# Load data
file_path <- ("C:/Users/91884/Desktop/BAIS/Statistical Data Mining/7/TelcoChurn (1).xlsx") 
telco_data <- read_excel(file_path)
str(telco_data)

#correlation
correlation_matrix <- cor(telco_data[c("SeniorCitizen", "tenure","MonthlyCharges","TotalCharges")])
corrplot(correlation_matrix, method = "pie")
print(correlation_matrix)

#asfactor
telco_data$customerID = factor(telco_data$customerID)
telco_data$gender = factor(telco_data$gender)
telco_data$InternetService = factor(telco_data$InternetService)
telco_data$gender = relevel(telco_data$gender,'Female')
telco_data$SeniorCitizen = as.factor(telco_data$SeniorCitizen)
telco_data$Partner = ifelse(telco_data$Partner=='Yes',1,0)
telco_data$Dependents  = ifelse(telco_data$Dependents=='Yes',1,0)
telco_data$PhoneService = ifelse(telco_data$PhoneService=='Yes',1,0)
telco_data$MultipleLines = ifelse(telco_data$MultipleLines=='Yes',1,0)
telco_data$OnlineSecurity = ifelse(telco_data$OnlineSecurity=='Yes',1,0)
telco_data$OnlineBackup = ifelse(telco_data$OnlineBackup=="Yes", 1, 0)
telco_data$DeviceProtection = ifelse(telco_data$DeviceProtection=="Yes", 1, 0)
telco_data$TechSupport = ifelse(telco_data$TechSupport=="Yes", 1, 0)
telco_data$StreamingTV = ifelse(telco_data$StreamingTV=="Yes", 1, 0)
telco_data$StreamingMovies = ifelse(telco_data$StreamingMovies=="Yes", 1, 0)
telco_data$Contract = factor(telco_data$Contract)
telco_data$Contract = relevel(telco_data$Contract, "Month-to-month")
telco_data$PaperlessBilling = ifelse(telco_data$PaperlessBilling=="Yes", 1, 0)
telco_data$PaymentMethod = factor(telco_data$PaymentMethod)
telco_data$PaymentMethod = relevel(telco_data$PaymentMethod, "Mailed check")
telco_data$Churn = ifelse(telco_data$Churn=="Yes", 1, 0)
telco_data$Churn = as.factor(telco_data$Churn)

#Creating Subsets
only_phone = telco_data[telco_data$PhoneService==1   & telco_data$InternetService=="No", ]
only_internet = telco_data[telco_data$InternetService!="No" & telco_data$PhoneService== 0 , ]
both_services = telco_data[telco_data$PhoneService==1   & telco_data$InternetService!="No", ]
str(only_phone)
str(only_internet)
str(both_services)

#models

set.seed(1024) #setting seed as mentioned in the question as 1024
sample_size = floor(0.75 * nrow(only_phone))
train_index = sample(seq_len(nrow(only_phone)), size=sample_size)
train_phone = only_phone[train_index, ]
test_phone = only_phone[-train_index, ]

sample_size = floor(0.75 * nrow(only_internet))
train_index = sample(seq_len(nrow(only_internet)), size=sample_size)
train_internet = only_internet[train_index, ]
test_internet = only_internet[-train_index, ]

sample_size = floor(0.75 * nrow(both_services))
train_index = sample(seq_len(nrow(both_services)), size=sample_size)
train_both = both_services[train_index, ]
test_both = both_services[-train_index, ]


phone_model = glm(Churn ~ gender + SeniorCitizen + Partner*Dependents + 
                     tenure*MultipleLines + Contract + PaperlessBilling + 
                     PaymentMethod + MonthlyCharges+TechSupport, data=train_phone,
                   family=binomial (link="logit"))

internet_model = glm(Churn ~ gender + SeniorCitizen + Partner*Dependents + 
                        tenure*MultipleLines + OnlineSecurity + OnlineBackup + DeviceProtection + 
                        TechSupport + StreamingTV + StreamingMovies + Contract + 
                        PaperlessBilling + PaymentMethod + MonthlyCharges,
                      data=train_internet, family=binomial (link="logit"))

both_model = glm(Churn ~ gender + SeniorCitizen + Partner*Dependents + 
                    tenure*MultipleLines + OnlineSecurity + OnlineBackup + 
                    DeviceProtection + TechSupport + StreamingTV + StreamingMovies + 
                    Contract + PaperlessBilling + PaymentMethod + MonthlyCharges, 
                  data=train_both, family=binomial (link="logit"))

# Summary of the models
stargazer(phone_model,internet_model,both_model,
          type = "text", single.row=TRUE,
          title = "Comparison of Models",
          align = TRUE)

# Exponentiated coefficients 
exp_coef_phone <- exp(coef(phone_model))
exp_coef_internet <- exp(coef(internet_model))
exp_coef_both <- exp(coef(both_model))

exp_coef_phone
exp_coef_internet
exp_coef_both


#Classification metrics
predlogit <- predict(phone_model, newdata=test_phone, type="response")
predlogit <- ifelse(predlogit>0.5, 1, 0)
length(predlogit)
length(test_phone$Churn)
table(test_phone$Churn, predlogit)

cm <- confusionMatrix(as.factor(predlogit), reference=test_phone$Churn)
cm$byClass['Recall']                           
cm$byClass['Precision']                        
cm$byClass['F1']                               
pr <- predict(predlogit, test_phone$Churn)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)                                                 
auc <- performance(pr, measure = "auc")
auc@y.values[[1]]

predlogit <- predict(internet_model, newdata=test_internet, type="response")
predlogit <- ifelse(predlogit>0.5, 1, 0)
table(test_internet$Churn, predlogit)
cm <-confusionMatrix(as.factor(predlogit), reference=test_internet$Churn)
cm$byClass['Recall']                           
cm$byClass['Precision']                        
cm$byClass['F1']                               

predlogit <-predict(both_model, newdata=test_both, type="response")
predlogit <- ifelse(predlogit>0.5, 1, 0)
table(test_both$Churn, predlogit)
cm <-confusionMatrix(as.factor(predlogit), reference=test_both$Churn)
cm$byClass['Recall']                           
cm$byClass['Precision']                        
cm$byClass['F1']     





