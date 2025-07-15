# Predicting Home Sale Price and Time on Market in Hunters Green

This project applies linear regression models to analyze and predict two key real estate outcomes for homes sold in the Hunters Green community between 2015 and 2020:
1. **Agent Days on Market (ADOM)** – the number of days it took a home to sell from listing to closing.
2. **Sale Price (PriceSold)** – the final price at which the property was sold.

Using real transactional data, the analysis identifies significant property characteristics that influence sale performance, including square footage, garage size, bathrooms, pool presence, lot size, and year built.

---

## 📊 Methodology

- **Feature selection** was based on domain rationale and correlation checks to avoid multicollinearity.
- For each dependent variable (ADOM and PriceSold), three regression models were tested and compared using statistical diagnostics.
- Models were evaluated using R², adjusted R², residual plots, and normality checks.
- The best models were selected based on interpretability and assumption validity.

---

## 🔍 Key Insights

- **ADOM:** Short sales significantly increase the number of days a home stays on the market. Larger square footage also slightly increases time to sale.
- **Sale Price:** The number of total bathrooms and lot size are strong predictors of final sale price. Surprisingly, square footage and bedroom count were not statistically significant in the final model.
- Properties sold later in the time window tended to close faster and at slightly higher prices.

---

## 🧰 Tools Used

- **R** for statistical modeling and regression diagnostics
- **Excel** for initial data exploration
- **Stargazer** for clean model summaries
- Visualizations: residual plots, QQ plots, histograms, correlation matrices

---

## 📁 Files Included

- `HuntersGreenHomeSales.xlsx`: The cleaned dataset
- `Problem_Statement.pdf`: Project objective and instructions
- `Solution_Documentation.pdf`: Model results, diagnostics, and interpretations

---

## 👤 Author

**Aryan Sharma**  
Regression Modeling | Real Estate Analytics | R Programming

---

## 📘 License

This project is shared for academic and portfolio demonstration purposes. Attribution is appreciated if reused.
