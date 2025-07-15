# BigMart Sales Analysis Using Multilevel Linear Regression

This project investigates sales performance across different store types and cities for a major retail chain using multilevel regression modeling. The analysis is conducted on item-level sales data spanning multiple outlets and includes both hierarchical and cross-sectional variables. The goal is to guide a business entrepreneur in selecting the best type of store and location for future franchising.

---

## 📊 Objectives

1. Identify which **outlet type** (Grocery, Supermarket Type I, II, III) returns the highest sales.
2. Determine the most profitable **city tier** (Tier 1, 2, or 3) for store performance.
3. Highlight the **top 3 and bottom 3 performing outlets** based on sales prediction models.

---

## 🧪 Modeling Approach

- **Model 1**: Linear regression with log-transformed sales (OLS)
- **Model 2**: Linear Mixed Effects Model with outlet-level random effects
- **Model 3**: Nested LMM accounting for outlets nested within city types (best-fit model)

### Diagnostics & Tools
- Log transformation of the skewed dependent variable (`Item_Sales`)
- Use of `lmer()` to model multilevel structure
- Evaluation using AIC, BIC, R², and residual plots

---

## 🔍 Key Insights

- **Outlet Type**: Supermarket Type III shows the **highest uplift in sales** (≈251% higher than grocery stores), followed by Type II (175%) and Type I (193%).
- **City Tier**: Tier 1 cities deliver the **highest sales**, outperforming Tier 2 (−1.6%) and Tier 3 (−3%).
- **Top Performing Outlets**:
  - `OUT027`: 50.1% better than baseline
  - `OUT035`: 5.8% better
  - `OUT049`: 1% better
- **Lowest Performing Outlets**:
  - `OUT019`: 192% worse than baseline
  - `OUT018`: 20% worse
  - `OUT046`: 3% worse

---

## 🧠 Predictors Used

- `Item_Visibility`: + More visibility improves likelihood of purchase
- `Item_Type`: + Past product demand
- `Item_MRP`: + Price influences perception and purchasing
- `Outlet_Type`: + Different formats perform differently
- `City_Type`: + Tier 1 locations have better performance
- `Outlet_Age`: ± Store reputation may affect local sales

---

## 🛠 Tools Used

- R: `lmer`, `lm`, `stargazer`, `corrplot`, `ggplot2`
- Excel: Initial data prep
- Visualization: Correlation heatmaps, boxplots, residual histograms

---

## 📁 Files Included

- `BigMartSales.xlsx`: Dataset
- `Problem_Statement.pdf`: Case objectives
- `Survival_model_Aryan_Sharma.pdf`: Full modeling write-up with results and recommendations

---

## 👤 Author

**Aryan Sharma**  
Retail Analytics | Hierarchical Modeling | R Programming

---

## 📘 License

This project is intended for academic and portfolio purposes. Attribution is appreciated if reused or referenced.
