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
- Predictors show no strong correlations (>80%), lowering multicollinearity concerns.  
- Each predictor contributes unique information, supporting diverse modeling techniques.

### Model Performance (Test MSE Comparison)

| Model | Test MSE | Interpretation |
|-------|----------|----------------|
| **Regression Tree** | 4.91 | Simple model underfits; moderate error |
| **Pruned Tree** | 4.98 | Slight performance drop after pruning |
| **Bagging** | 2.83 | Strong improvement; variance reduction effective |
| **Random Forest** | 2.74 (mtry = 6) | Best ensemble performer after BART; handles nonlinearities well |
| **BART** | **1.55** | **Best model overall; captures complex interactions** |

### Variable Importance (Across Models)

**Most influential predictors:**
- ShelveLoc  
- Price  
- CompPrice  
- Age  
- Advertising  

**Lower-value predictors:**
- Population  
- Urban  
- Education  

These add limited predictive value and appear consistently low across model importance rankings.

---

## 💡 Final Recommendation

Based on Test MSE performance, **BART** is the most accurate model for predicting Sales, significantly outperforming all other models. Random Forest and Bagging also deliver strong results and should be preferred over single-tree methods for business analytics applications.

Businesses modeling retail sales should prioritize:
- **Nonlinear ensemble methods** (Bagging, Random Forest, BART)  
- **Key predictors such as ShelveLoc, Price, and Competition Pricing**  

Regression trees remain valuable for interpretability but lack predictive precision compared to ensemble models.

---

## 🛠 Tools Used

- **R Programming**  
  - `ggplot2`  
  - `tree`  
  - `randomForest`  
  - `partykit`  
  - `dbarts` / `bartMachine`  
  - `corrplot`  
- Exploratory visualization  
- Tree-based modeling and ensemble techniques  

---

## 📁 Files Included

- `Carseats_Analysis_Aryan_Sharma.R` — Full analysis code  
- `Carseats_Sales_Report.pdf` — Detailed write-up with interpretations  
- `carseats_plots/` — Plots, tree diagrams, and visualizations  

---

## 👤 Author

**Aryan Sharma**  
Retail Analytics | Machine Learning | Tree-Based Models | R Programming

---

## 📘 License

This project is intended for educational and portfolio use. Attribution is appreciated if reused or referenced.
