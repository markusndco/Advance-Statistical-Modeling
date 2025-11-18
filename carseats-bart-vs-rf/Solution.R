
# Load required libraries
library(ggplot2)
library(rio)
library(moments)
library(stargazer)
library(corrplot)
library(ellipse)
library(car)
library(corrplot)
library(ISLR)          
library(tree)          
library(randomForest)  
library(rpart)
library(bayestree)


# Load data
data("Carseats")
str(Carseats)

#Setting seed hence the training and test data is always same
set.seed(1)

#histogram & Boxplot of Y variable
hist(Carseats$Sales)
boxplot(Carseats$Sales, main = "Boxplot of Sales", ylab = "Sales")

#correlation
correlation_matrix <- cor(Carseats[c("CompPrice", "Income","Advertising","Population","Price","Age","Education")])
corrplot(correlation_matrix, method = "pie")
print(correlation_matrix)

#A) Splitting the data 
sample_size <- floor(0.75 * nrow(Carseats))
train_index  <- sample(seq_len(nrow(Carseats)), size = sample_size)

train_carseats <- Carseats[train_index, ]
test_carseats  <- Carseats[-train_index, ]

#B) Regression tree
tree_carseats <- tree(Sales ~ ., data = train_carseats)
summary(tree_carseats)

#plotting the tree
ctree_model <- ctree(Sales ~ ., data = train_carseats)

plot(ctree_model, 
     main = "Conditional Regression Tree for Carseats",
     gp = gpar(fontsize = 8))

#results
y_test    <- test_carseats$Sales
pred_tree <- predict(tree_carseats, newdata = test_carseats)
mse_tree  <- mean((y_test - pred_tree)^2)
mse_tree

#c) Optimal Level of Complexity
cv_tree <- cv.tree(tree_carseats)  # 10-fold CV by default
cv_tree$size
cv_tree$dev

best_size <- cv_tree$size[which.min(cv_tree$dev)]
best_size

pruned_tree <- prune.tree(tree_carseats, best = best_size)

# Correct plot
plot(pruned_tree)
text(pruned_tree, pretty = 0, cex = 0.7)
title("Pruned Regression Tree for Carseats")


# Test MSE for pruned tree
pred_pruned <- predict(pruned_tree, newdata = test_carseats)
mse_pruned  <- mean((y_test - pred_pruned)^2)
mse_pruned


#d) Bagging
# number of predictors (exclude Sales)
p <- ncol(train_carseats) - 1  

set.seed(2)
bag_carseats <- randomForest(
  Sales ~ .,
  data       = train_carseats,
  mtry       = p,          # all predictors at each split = bagging
  importance = TRUE
)

# Test MSE for bagging
pred_bag <- predict(bag_carseats, newdata = test_carseats)
mse_bag  <- mean((y_test - pred_bag)^2)
mse_bag

# Variable importance (bagging)
importance(bag_carseats)
varImpPlot(bag_carseats)

#E) Random forests

rf_carseats <- randomForest(
  Sales ~ .,
  data       = train_carseats,
  mtry       = floor(sqrt(p)),
  importance = TRUE
)

# Test MSE for random forest
pred_rf <- predict(rf_carseats, newdata = test_carseats)
mse_rf  <- mean((y_test - pred_rf)^2)
mse_rf

# Variable importance (random forest)
importance(rf_carseats)
varImpPlot(rf_carseats)

# Effect of m (mtry) on test error
mtry_vals <- 2:p
mse_vals  <- numeric(length(mtry_vals))

set.seed(4)
for (i in seq_along(mtry_vals)) {
  tmp_rf <- randomForest(Sales ~ ., data = train_carseats,
                         mtry = mtry_vals[i])
  tmp_pred <- predict(tmp_rf, newdata = test_carseats)
  mse_vals[i] <- mean((y_test - tmp_pred)^2)
}

mtry_mse_table <- data.frame(mtry = mtry_vals, test_MSE = mse_vals)
mtry_mse_table

# plot
plot(mtry_vals, mse_vals, type = "b",
xlab = "mtry (number of variables at each split)",
ylab = "Test MSE")


#F)BART

x_train <- model.matrix(Sales ~ ., data = train_carseats)[, -1]  # drop intercept
x_test  <- model.matrix(Sales ~ ., data = test_carseats)[, -1]
bart_fit <- bart(
  x.train = x_train,
  y.train = train_carseats$Sales,
  x.test  = x_test,
  ndpost  = 1000,   # number of posterior draws kept
  nskip   = 1000    # burn-in
)

# Posterior mean predictions on test set
pred_bart <- bart_fit$yhat.test.mean

# Test MSE for BART
mse_bart <- mean((y_test - pred_bart)^2)
mse_bart
