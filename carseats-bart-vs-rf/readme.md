# Carseats Sales Prediction and Tree-Based Modeling

This project analyzes the **Carseats** dataset from the **ISLR** package to understand how store characteristics, pricing strategies, and demographic factors influence product Sales. Multiple machine learning models—including regression trees, pruned trees, bagging, random forests, and BART—are applied to compare predictive accuracy and identify the strongest drivers of Sales performance.

The goal is to determine which store-level and market-level features best explain Sales variation and which modeling approach delivers the most accurate predictions.

---

## 📊 Business Questions

This project investigates the following:

1. **What factors significantly impact product Sales across stores?**  
   Key predictors explored:  
   - Price  
   - Shelf placement (ShelveLoc)  
   - Competition pricing (CompPrice)  
   - Advertising spend  
   - Demographics: Income, Age, Population, Urban, Education  

2. **Which machine learning method best predicts Sales?**  
   Models compared:  
   - Regression Tree  
   - Pruned Tree  
   - Bagging  
   - Random Forest  
   - BART  

3. **Which predictors consistently emerge as the strongest drivers of Sales?**  
   Observed patterns across models show:  
   - **ShelveLoc**, **Price**, and **CompPrice** are the primary influences  
   - **Population** and **Urban** contribute minimally  

---

## 🧪 Methodology

### 1. Exploratory Data Analysis
- Distribution analysis (histograms, boxplots)  
- Correlation plots for multicollinearity  
- Summary statistics to understand feature behavior  

### 2. Data Preparation
- 75/25 Train–Test split  
- Seed set for reproducibility  
- Categorical predictors converted to factors where necessary  

### 3. Modeling Approaches

| Model | Purpose |
|-------|---------|
| **Regression Tree** | Baseline tree model for interpretability |
| **Pruned Tree** | Reduced complexity using cross-validation |
| **Bagging** | Variance reduction via bootstrap aggregation |
| **Random Forest** | Ensemble model with feature randomness |
| **BART** | Bayesian additive modeling for nonlinear patterns |

All models were evaluated using **Test MSE**.

---

## 🔍 Key Insights

### Exploratory Findings
- Sales distribution is slightly right-skewed but suitable for regression.  
- Predi
